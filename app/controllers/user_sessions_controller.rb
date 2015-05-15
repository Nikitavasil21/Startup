class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
  end

  def create
    if @user = login(login_params[:email], login_params[:password])
      redirect_to(edit_profiles_path, notice: 'Login successful')
    else
      redirect_to(root_path, error: 'Error')
    end
  end

  def destroy
    logout
    flash.now[:notice] = "Logged out"
    redirect_to root_path
  end

  private
   def login_params
     params.permit(:email, :password, :password_confirmation)
  end
end
