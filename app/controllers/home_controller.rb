class HomeController < ApplicationController

  def index
    stream = Stream.where(name: params[:search]).includes(:minds).first
    @minds = stream.minds unless stream.nil?
  end
end
