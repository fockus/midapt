class MindTagsController < ApplicationController
  before_action :set_mind_tag, only: [:show, :edit, :update, :destroy]

  # GET /mind_tags
  # GET /mind_tags.json
  def index
    @mind_tags = MindTag.all
  end

  # GET /mind_tags/1
  # GET /mind_tags/1.json
  def show
  end

  # GET /mind_tags/new
  def new
    @mind_tag = MindTag.new
  end

  # GET /mind_tags/1/edit
  def edit
  end

  # POST /mind_tags
  # POST /mind_tags.json
  def create
    @mind_tag = MindTag.new(mind_tag_params)

    respond_to do |format|
      if @mind_tag.save
        format.html { redirect_to @mind_tag, notice: 'Mind tag was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mind_tag }
      else
        format.html { render action: 'new' }
        format.json { render json: @mind_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mind_tags/1
  # PATCH/PUT /mind_tags/1.json
  def update
    respond_to do |format|
      if @mind_tag.update(mind_tag_params)
        format.html { redirect_to @mind_tag, notice: 'Mind tag was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mind_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mind_tags/1
  # DELETE /mind_tags/1.json
  def destroy
    @mind_tag.destroy
    respond_to do |format|
      format.html { redirect_to mind_tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mind_tag
      @mind_tag = MindTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mind_tag_params
      params[:mind_tag]
    end
end
