class SessionsController < ApplicationController
  before_action :require_no_user, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path # TODO: mostrar error en contraseña y/o mail
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
