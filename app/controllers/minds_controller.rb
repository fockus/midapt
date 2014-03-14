class MindsController < ApplicationController
  before_filter :authenticate_user! # Device
  before_action :set_mind, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource param_method: :mind_params # CanCan


  def index
    # GET /minds 
    @minds = current_user.minds.eager_load(:streams)
  end

  # GET /minds/1
  def show
  end

  # GET /minds/new
  def new
    @mind = current_user.minds.new
    @mind.streams.build
  end

  # GET /minds/1/edit
  def edit
    @mind.streams.build
  end

  # POST /minds
  def create
    @mind = Mind.new(mind_params)
    @mind = current_user.minds.create(mind_params)
    if @mind.errors.empty?
      redirect_to @mind, notice: 'Mind was successfully created.'
    else
      render action: 'new'
    end
  end


  # PATCH/PUT /minds/1
  def update
    if @mind.update_attributes(mind_params)
      redirect_to @mind, notice: 'Mind was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /minds/1
  def destroy
    @mind.destroy
    redirect_to minds_url
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mind
      render_404 unless @mind = Mind.eager_load(:streams).where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mind_params
      #params.require(:mind).permit(:question, :text, streams_attributes: [:id, :name])
      params.require(:mind).permit(:question, :text)
    end

end
