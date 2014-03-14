class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Turn on request forgery protection. Bear in mind that only non-GET, HTML/JavaScript requests are checked.
  protect_from_forgery with: :exception 

  before_filter :configure_permitted_parameters, if: :devise_controller?

  #check_authorization # Гарантированная проверка прав Can Can
  #skip_authorization_check :only => [:new, :create]

  # Перехватываем исключения CanCan
  #rescue_from CanCan::AccessDenied do |exception|
  #  render_403
  #end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit! }
  end

  def render_404
    respond_to do |format|
      format.html { render :file => 'public/404', :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def render_403
    respond_to do |format|
      format.html { render :file => 'public/403', :layout => false, :status => :forbidden }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end



end

