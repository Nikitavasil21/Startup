class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if @user = login(login_params[:email], login_params[:password])
      redirect_to(profile_path, notice: 'Login successful')
    else
      flash.now[:alert] = "Try again,bro"
      redirect_to user_sessions_part
    end
  end

  def destroy
    logout
    flash.now[:notice] = "Logged out"
    redirect_to root_path
  end

  private
   def login_params
    params.permit(:email, :password)
  end
end
