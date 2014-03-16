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
  end

  def edit
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
    #debugger
    if @mind.update mind_params
      new_names = params[:mind][:streams].split(' ')
      @mind.streams.each do |stream|
          @mind.streams.delete stream if new_names.index { |s| s == stream.name }.nil?
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
      render_404 unless @mind = Mind.where(id: params[:id]).first
    end

    def mind_params
      params.require(:mind).permit(:title, :text)
    end

end
