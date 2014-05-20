class StreamsController < ApplicationController
  before_action :set_stream, only: [:show, :edit, :update, :destroy]

  def index
    @streams = Stream.all
  end

  def show
  end

  def new
    @stream = Stream.new
  end

  def edit
  end

  def create
    @stream = Stream.new stream_params

    respond_to do |format|
      if @stream.save
        format.html { redirect_to @stream, notice: 'stream was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stream }
      else
        format.html { render action: 'new' }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @stream.update(stream_params)
        format.html { redirect_to @stream, notice: 'stream was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stream.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @stream.destroy
    respond_to do |format|
      format.html { redirect_to streams_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_stream
    @stream = Stream.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def stream_params
    params.require(:stream).permit(:name)
  end
end
