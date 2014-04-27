class HomeController < ApplicationController

  def index
    stream = Stream.where(name: params[:search]).includes(:minds).first 
    @minds = stream.minds unless stream.nil?
  end

  def mind
    if @mind = Mind.where(id: params[:id]).includes(:streams).first
    	render :template => "minds/show"  
    else
    	render_404
    end
  end


end
