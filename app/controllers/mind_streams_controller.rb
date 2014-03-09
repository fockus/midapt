class MindStreamsController < ApplicationController
  before_action :set_mind_stream, only: [:show, :edit, :update, :destroy]

  # GET /mind_streams
  # GET /mind_streams.json
  def index
    @mind_streams = MindStream.all
  end

  # GET /mind_streams/1
  # GET /mind_streams/1.json
  def show
  end

  # GET /mind_streams/new
  def new
    @mind_stream = MindStream.new
  end

  # GET /mind_streams/1/edit
  def edit
  end

  # POST /mind_streams
  # POST /mind_streams.json
  def create
    @mind_stream = MindStream.new(mind_stream_params)

    respond_to do |format|
      if @mind_stream.save
        format.html { redirect_to @mind_stream, notice: 'Mind stream was successfully created.' }
        format.json { render action: 'show', status: :created, location: @mind_stream }
      else
        format.html { render action: 'new' }
        format.json { render json: @mind_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mind_streams/1
  # PATCH/PUT /mind_streams/1.json
  def update
    respond_to do |format|
      if @mind_stream.update(mind_stream_params)
        format.html { redirect_to @mind_stream, notice: 'Mind stream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mind_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mind_streams/1
  # DELETE /mind_streams/1.json
  def destroy
    @mind_stream.destroy
    respond_to do |format|
      format.html { redirect_to mind_streams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mind_stream
      @mind_stream = MindStream.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mind_stream_params
      params.require(:mind_stream).permit(:mind_id, :stream_id)
    end
end
