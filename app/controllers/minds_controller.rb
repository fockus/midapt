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
    @mind = current_user.minds.new mind_params
    @mind.errors.empty? ? save_and_notificate(mind: @mind, action: 'create') : render(action: 'new')
  end

  def update
    @mind.assign_attributes(mind_params) ? save_and_notificate(mind: @mind, action: 'update') : render(action: 'edit')
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
      params.require(:mind).permit(:title, :text, :streams_string)
    end


    def save_streams mind
      new_names = mind_params['streams_string'].split(' ')
      mind.streams.each do |stream|
          mind.streams.delete stream if new_names.index { |s| s == stream.name }.nil?
      end  

      new_names.each do |stream_name|
        if mind.streams.index { |s| s.name == stream_name }.nil?
          stream = Stream.where(name: stream_name).first
          mind.streams << (stream.nil? ? Stream.new(:name => stream_name) : stream)
        end
      end      
    end


    def save_and_notificate(hash, mind=hash[:mind])
      save_streams mind
      mind.save
      if hash[:action] == 'update'
        redirect_to mind, notice: 'Mind was successfully updated.', action: 'index'
      elsif hash[:action] == 'create'
        redirect_to mind, notice: 'Mind was successfully created.', action: 'index'
      end     
    end

end
