class ApplicationController < ActionController::Base
  helper_method :current_user
  
  def current_user
    # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  protected
 
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to new_user_session_path, notice: "Please log in"
    end
  end
end
