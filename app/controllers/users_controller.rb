class UsersController < ApplicationController
  before_action :require_admin, only: [:grant_admin]
  before_action :require_no_user, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update, :edit_password, :update_password, :destroy, :grant_admin]
  before_action :correct_user, only: [:edit, :update, :edit_password, :update_password, :destroy]

  def index
    @users = User.all
  end

  def show
    @artists = @user.artists # Artists from the user
    @songs = @user.songs
    
    @favorite_songs = @user.favorite_songs
    @favorite_artists = @user.favorite_artists
    @favorite_albums = @user.favorite_albums

    is_shown_user_admin = is_user_admin? @user
    is_logged_user_admin = is_current_user_admin?

    @can_grant_admin = is_logged_user_admin && !is_shown_user_admin
    @show_is_admin = is_logged_user_admin && is_shown_user_admin
    # Only show that is admin to the other admins
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to signup_path
    end
  end

  def update
    @user.updating_password = false
    update_user
  end

  def edit_password
    render :edit_password
  end

  def update_password
    @user.updating_password = true
    update_user
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  def grant_admin
    success = @user.update({ role: 'admin' })
    # TODO: show message indicating that is admin
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
      @has_permission = has_modify_permission?(@user)
    end

    def correct_user
      set_user
      redirect_to root_path unless @has_permission
    end

    def update_user
      if @user.update(user_params)
        redirect_to @user
      else
        render (@user.updating_password ? :edit_password : :edit)
      end
    end
end
