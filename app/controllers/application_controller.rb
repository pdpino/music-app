class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user # makes current_user available in the views
  helper_method :current_user?

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound # Can't find user
      @current_user = nil
      session[:user_id] = nil # necessary for closing session?
      # REVIEW: notify user??
    end
  end

  def current_user?(user)
    user == current_user
  end

  def require_user
    redirect_to login_path unless current_user
  end

  def index

  end
end
