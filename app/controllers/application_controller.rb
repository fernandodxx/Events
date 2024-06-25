class ApplicationController < ActionController::Base
  helper_method :current_user, :user_signed_in?
  
  private

  def current_user
    # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path, alert: 'Você precisa estar logado para acessar esta página.'
    end
  end

  protected
 
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to new_user_session_path, notice: "Please log in"
    end
  end
end
