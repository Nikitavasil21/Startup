class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(:users, notice: 'Login successful')
    else
      flash.now[:alert] = "Ssory,bro"
      render action 'new'
    end
  end

  def destroy
    logout
    flash.now[:notice] = "Logged out"
    redirect_to root_path
  end

  private
    def login_params
      params.permit(:email,:password)
    end
end
