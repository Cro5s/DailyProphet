class ApplicationController < ActionController::Base
  before_action :set_current_user
  protect_from_forgery with: :exception

  def set_current_user
    return nil unless session[:session_token]

    Current.user = User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    set_current_user&.reset_session_token!
    session[:session_token] = nil
  end

  private

  def ensure_logged_in
    render :json ['Must be logged in for that.'], status: :unauthorized unless logged_in?
  end

  def logged_in?
    !!set_current_user
  end
end
