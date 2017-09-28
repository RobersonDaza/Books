class SessionsController < ApplicationController

    before_action :authenticate_user!, except: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user and user.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in!"
      @current_user = user
      redirect_to welcome_path
    else
      flash[:error] = "invalid credentials!"
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = "Logout successfully!"
    redirect_to new_session_path
  end

  def welcome
  end

  private


  def session_params
    params.require(:session).permit(:email, :password)
  end
end
