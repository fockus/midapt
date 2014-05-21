class MarksController < ApplicationController
  before_filter :authenticate_user!, only: [:create] # Device
  before_action :set_mark, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource param_method: :mark_params

  def index
    @marks = Mark.all
  end

  def show
  end

  def new
    @mark = Mark.new
  end

  def edit
  end

  def create
    @markable = find_markable
    @mark = @markable.marks.build(params[:mark].permit(:mark))
    @mark.user_id = current_user.id
    if @mark.save
      redirect_to polymorphic_path(@markable)
    else
      flash[:notice] = "something went wrong"
      redirect_to polymorphic_path(@markable)
    end
  end

  def update
    respond_to do |format|
      if @mark.update(mark_params)
        format.html { redirect_to @mark, notice: 'User comment mark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mark.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mark.destroy
    respond_to do |format|
      format.html { redirect_to marks_url }
      format.json { head :no_content }
    end
  end

  private
  def set_mark
    @mark = Mark.find(params[:id])
  end

  def mark_params
    params.require(:mark).permit(:mark)
  end

  def find_markable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
  end
end
