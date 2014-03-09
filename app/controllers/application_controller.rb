class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception # надо выяснить что это!
  before_filter :configure_permitted_parameters, if: :devise_controller?  # надо выяснить что это!


  #rescue_from CanCan::AccessDenied do
  #  render_403
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

