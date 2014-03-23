class HomeController < ApplicationController

  def index
    stream = Stream.where(name: params[:search]).first 
    @minds = stream.minds unless stream.nil?
  end

#  def show
#  	@mind = Mind.where(id: params[:id]).eager_load(:streams).first
#  end


end
