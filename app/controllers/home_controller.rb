class HomeController < ApplicationController

  def index
    @minds = Mind.all
  end

#  def show
#  	@mind = Mind.where(id: params[:id]).eager_load(:streams).first
#  end


end
