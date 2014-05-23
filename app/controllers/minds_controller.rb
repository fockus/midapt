class MindsController < ApplicationController
  before_filter :authenticate_user!, only: [:user_index, :new, :create, :edit, :update] # Device
  before_action :set_mind, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource param_method: :mind_params # CanCan


  def index
    @minds = Mind.all.includes :streams
  end

  def user_index
    @minds = current_user.minds.includes :streams
    render(action: 'index')
  end

  def show
    @mind
    @marks_sum = Mark.where(markable_id: @mind.id, markable_type: 'Mind').sum('mark')
    @has_voted = !(current_user.nil? || Mark.where(user_id: current_user.id, markable_id: @mind.id, markable_type: 'Mind').empty?)
  end

  def new
    @mind = current_user.minds.new
  end

  def edit
  end

  def create
    @mind = current_user.minds.new mind_params
    @mind.valid? ? save_and_notificate(mind: @mind, action: 'create') : render(action: 'new')
  end

  def update
    @mind.assign_attributes(mind_params)
    @mind.valid? ? save_and_notificate(mind: @mind, action: 'update') : render(action: 'edit')
  end

  def destroy
    @mind.destroy
    redirect_to minds_url
  end

  private

  def set_mind
    render_404 unless @mind = Mind.where(id: params[:id]).includes(:streams, :comments).first
  end

  def mind_params
    params.require(:mind).permit(:title, :text, :streams_names)
  end

  def save_and_notificate(hash, mind=hash[:mind])
    mind.assign_streams
    mind.save
    if hash[:action] == 'update'
      redirect_to mind, notice: 'Mind was successfully updated.', action: 'index'
    elsif hash[:action] == 'create'
      redirect_to mind, notice: 'Mind was successfully created.', action: 'index'
    end
  end

end
