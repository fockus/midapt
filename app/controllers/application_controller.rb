class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Turn on request forgery protection. Bear in mind that only non-GET, HTML/JavaScript requests are checked.
  protect_from_forgery with: :exception 
  
  if :devise_controller?
    before_filter :configure_permitted_parameters
  else
    enable_authorization
  end  

  #enable_authorization :unless => :devise_controller?
  #before_filter :configure_permitted_parameters, if: :devise_controller?

  #check_authorization # Гарантированная проверка прав Can Can
  #skip_authorization_check :only => [:new, :create]

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
    #render_403
  end


  #It may be a good idea to specify the rescue from action:
  rescue_from CanCan::Unauthorized do |exception|
    if current_user.nil?
      session[:next] = request.fullpath
      puts session[:next]
      redirect_to login_url, :alert => "You have to log in to continue."
    else
      #render :file => "#{Rails.root}/public/403.html", :status => 403
      if request.env["HTTP_REFERER"].present?
        redirect_to :back, :alert => exception.message
      else
        redirect_to root_url, :alert => exception.message
      end
    end
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

