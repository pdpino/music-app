class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user # makes current_user available in the views

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound # Can't find user
      @current_user = nil
      # TODO: also delete session
      # TODO: notify user??
    end
  end

  def require_user
    redirect_to login_path unless current_user
  end

  def index

  end
end
