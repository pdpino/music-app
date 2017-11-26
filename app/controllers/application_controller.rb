class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # makes methods available in the views
  helper_method :current_user, :is_current_user_admin?, :is_in?, :has_create_permission, :has_modify_permission?

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

  def has_create_permission
    # NOTE: this method could seem like an overkill (just 'current_user' could be used), but adds semantic to the calling and may need to be more powerful in the future (e.g., checking roles)
    current_user || false
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

  def require_self(user)
    redirect_to :back unless user == current_user
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
    if is_current_user_admin?
      selected_home = "admin"
    elsif current_user
      selected_home = "user"
    else
      selected_home = "guest"
    end
    render :index, locals: { selected_home: selected_home }
  end
end
