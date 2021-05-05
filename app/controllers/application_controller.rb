class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :keep_out_unless_logged_in
  helper_method :current_user

  protected

  # accessor
  def current_user
    # Avoid unnecessary database queries
    @current_user ||= User.find(session[:user_id])
  end

  # mutator:  gets set in sessions controller
  def current_user=(user)
    p user  
    puts "current_user"
    @current_user = user
  end
    
  def keep_out_unless_logged_in
    redirect_to landing_page_index_path unless (!!current_user)
  end 

end
