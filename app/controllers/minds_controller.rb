class MindsController < ApplicationController
  #load_and_authorize_resource  # CanCan
  before_action :set_mind, only: [:show, :edit, :update, :destroy]


  def index
    # GET /minds
    #@minds = Mind.where( user_id: current_user.id )
    @user = current_user
    @minds = @user.minds

    #@minds = Mind.my_minds

 
  end

  # GET /minds/1
  def show
  end

  # GET /minds/new
  def new
    @mind = Mind.new
  end

  # GET /minds/1/edit
  def edit
  end

  # POST /minds
  def create
    @mind = Mind.new(mind_params)
    @mind.user_id = current_user.id
    if @mind.save
      redirect_to @mind, notice: 'Mind was successfully created.'
    else
      render action: 'new'
    end
  end


  # PATCH/PUT /minds/1
  def update
    if @mind.update(mind_params)
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
      @mind = Mind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mind_params
      params.require(:mind).permit(:question, :text)
    end
end
