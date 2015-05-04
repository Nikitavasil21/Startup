class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to(profile_path, notice: 'User was successfully created')
    else
      flash[:error] = "You must try again"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to(profile_path, notice: 'Profile updated')
    else
      redirect_to(profile_path, notice: 'Error')
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
