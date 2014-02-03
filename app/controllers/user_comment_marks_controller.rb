class UserCommentMarksController < ApplicationController
  before_action :set_user_comment_mark, only: [:show, :edit, :update, :destroy]

  # GET /user_comment_marks
  # GET /user_comment_marks.json
  def index
    @user_comment_marks = UserCommentMark.all
  end

  # GET /user_comment_marks/1
  # GET /user_comment_marks/1.json
  def show
  end

  # GET /user_comment_marks/new
  def new
    @user_comment_mark = UserCommentMark.new
  end

  # GET /user_comment_marks/1/edit
  def edit
  end

  # POST /user_comment_marks
  # POST /user_comment_marks.json
  def create
    @user_comment_mark = UserCommentMark.new(user_comment_mark_params)

    respond_to do |format|
      if @user_comment_mark.save
        format.html { redirect_to @user_comment_mark, notice: 'User comment mark was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_comment_mark }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_comment_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_comment_marks/1
  # PATCH/PUT /user_comment_marks/1.json
  def update
    respond_to do |format|
      if @user_comment_mark.update(user_comment_mark_params)
        format.html { redirect_to @user_comment_mark, notice: 'User comment mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_comment_mark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_comment_marks/1
  # DELETE /user_comment_marks/1.json
  def destroy
    @user_comment_mark.destroy
    respond_to do |format|
      format.html { redirect_to user_comment_marks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_comment_mark
      @user_comment_mark = UserCommentMark.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_comment_mark_params
      params.require(:user_comment_mark).permit(:mark)
    end
end
