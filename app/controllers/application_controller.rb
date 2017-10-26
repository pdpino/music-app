class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_current_user_admin? # makes methods available in the views

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound # Can't find user
      @current_user = nil
      session[:user_id] = nil # necessary for closing session?
      # REVIEW: notify user??
    end
  end

  def has_modify_permission?(user)
    # NOTE: 'modify permissions' includes editing and deleting
    user == current_user || is_current_user_admin?
  end

  def is_current_user_admin?
    current_user && is_user_admin?(current_user)
  end

  def is_user_admin? user
    user.role == 'admin'
  end

  def require_user
    # TODO: show message
    redirect_to login_path unless current_user
  end

  def require_no_user
    # TODO: message
    redirect_to root_path if current_user
  end

  def require_admin
    redirect_to root_path unless is_current_user_admin?
  end

  def index
    # USE AS HOME
  end
end
