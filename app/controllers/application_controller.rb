class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?


  rescue_from CanCan::AccessDenied do
    render_403
  end

  #rescue_from CanCan::AccessDenied do |exception|
  #  flash[:error] = "Access denied."
  #  redirect_to root_url
  #end

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

