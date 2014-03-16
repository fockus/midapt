class MindsController < ApplicationController
  before_filter :authenticate_user! # Device
  before_action :set_mind, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource param_method: :mind_params # CanCan


  def index
    @minds = current_user.minds.eager_load :streams
  end

  def show
  end

  def new
    @mind = current_user.minds.new
    3.times { @mind.streams.build }
  end

  def edit
    # максимальное количество потоков может быть 3
    (3 - @mind.streams.length).times { @mind.streams.build }  
  end

  def create
    @mind = current_user.minds.create mind_params
    
    if @mind.errors.empty?
      redirect_to @mind, notice: 'Mind was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @mind.update_attributes mind_params
      new_names = params[:mind][:streams].split(' ')
      @mind.streams.each do |stream|
        if(new_names.index { |s| s == stream.name }.nil?)
          @mind.streams.delete(stream)
        end
      end
      new_names.each do |stream_name|
        if @mind.streams.index { |s| s.name == stream_name }.nil?
          stream = Stream.where(name: stream_name).first
          @mind.streams << (stream.nil? ? Stream.new(:name => stream_name) : stream)
        end
      end
      @mind.save
      redirect_to @mind, notice: 'Mind was successfully updated.'
    else
      render action: 'edit'
    end

  end

  def destroy
    @mind.destroy
    redirect_to minds_url
  end


  private
    def set_mind
      render_404 unless @mind = Mind.where(id: params[:id]).eager_load(:streams, :user).first
    end

    def mind_params
      params.require(:mind).permit(:title, :text, streams_attributes: [:id, :name])
    end

end
