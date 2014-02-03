class MindsController < ApplicationController
  before_action :set_mind, only: [:show, :edit, :update, :destroy]

  # GET /minds
  # GET /minds.json
  def index
    @minds = Mind.all
  end

  # GET /minds/1
  # GET /minds/1.json
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
  # POST /minds.json
  def create
    @mind = Mind.new(mind_params)

    respond_to do |format|
      if @mind.save
        format.html { redirect_to @mind, notice: 'Mind was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mind }
      else
        format.html { render action: 'new' }
        format.json { render json: @mind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minds/1
  # PATCH/PUT /minds/1.json
  def update
    respond_to do |format|
      if @mind.update(mind_params)
        format.html { redirect_to @mind, notice: 'Mind was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minds/1
  # DELETE /minds/1.json
  def destroy
    @mind.destroy
    respond_to do |format|
      format.html { redirect_to minds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mind
      @mind = Mind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mind_params
      params.require(:mind).permit(:title, :text, :user_id)
    end
end
