class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_current_user_admin?, :is_in? # makes methods available in the views

  def current_user
    # REVIEW: this method is called a lot of times, the query is being done again and again?
    # ruby optimizes it?
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

  def is_in? instance_array, searched_instance
    # Helper method:
    # Boolean inidicating if 'searched_instance' is in 'instance_array', searching with the id
    # Used in the views like:
    # is_in?(@song_albums, an_album), to check if is the album is one of the song
    instance_array && instance_array.index { |instance| instance.id == searched_instance.id }
  end

  def index
    # USE AS HOME
  end
end
