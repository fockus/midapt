class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :edit] # Device
  before_action :set_mind, only: [:new, :create]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    if (@mind)
      @comment = current_user.comments.new(mind_id: params[:mind_id])
    else
      render_404
    end
  end

  def edit
  end

  def create
    if (@mind)
      @comment = Comment.new(comment_params)
      respond_to do |format|
        if @comment.save
          format.html { redirect_to @comment.mind, notice: 'Comment was successfully created.' }
          format.json { render action: 'show', status: :created, location: @comment }
        else
          format.html { render action: 'new' }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    else
      render_404
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.mind }
      format.json { head :no_content }
    end
  end

  private
  def set_mind
    @mind = Mind.where(id: params[:mind_id]).first
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:message, :mind_id, :user_id)
  end
end
