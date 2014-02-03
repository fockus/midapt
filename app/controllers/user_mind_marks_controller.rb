class UserMindMarksController < ApplicationController
  before_action :set_user_mind_mark, only: [:show, :edit, :update, :destroy]

  # GET /user_mind_marks
  # GET /user_mind_marks.json
  def index
    @user_mind_marks = UserMindMark.all
  end

  # GET /user_mind_marks/1
  # GET /user_mind_marks/1.json
  def show
  end

  # GET /user_mind_marks/new
  def new
    @user_mind_mark = UserMindMark.new
  end

  # GET /user_mind_marks/1/edit
  def edit
  end

  # POST /user_mind_marks
  # POST /user_mind_marks.json
  def create
    @user_mind_mark = UserMindMark.new(user_mind_mark_params)

    respond_to do |format|
      if @user_mind_mark.save
        format.html { redirect_to @user_mind_mark, notice: 'User mind mark was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_mind_mark }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_mind_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_mind_marks/1
  # PATCH/PUT /user_mind_marks/1.json
  def update
    respond_to do |format|
      if @user_mind_mark.update(user_mind_mark_params)
        format.html { redirect_to @user_mind_mark, notice: 'User mind mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_mind_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_mind_marks/1
  # DELETE /user_mind_marks/1.json
  def destroy
    @user_mind_mark.destroy
    respond_to do |format|
      format.html { redirect_to user_mind_marks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_mind_mark
      @user_mind_mark = UserMindMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_mind_mark_params
      params.require(:user_mind_mark).permit(:mark)
    end
end
