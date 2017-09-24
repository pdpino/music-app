class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @artists = @user.artists # Artists from the user
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
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
      # NOTE: do not permit :role param, so nobody can give admin role to an user
    end

    def set_user
      @user = User.find(params[:id])
      @has_permission = current_user?(@user)
    end

    def correct_user
      set_user
      redirect_to root_path unless @has_permission
    end
end
