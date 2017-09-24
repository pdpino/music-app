class SessionsController < ApplicationController

  def new
    return unless can_login
  end

  def create
    return unless can_login

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

  private
    def can_login
      if current_user
        redirect_to root_path
        # TODO: mostrar mensaje, tiene que hacer logout para volver a hacer login
        false
      end
      true
    end

end
