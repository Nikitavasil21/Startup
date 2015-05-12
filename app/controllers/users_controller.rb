class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save!
      auto_login(user)
      redirect_to(edit_profile_path(user), notice: 'User was successfully created')
    else
      redirect_to(edit_profile_path(user), error: 'You must try again')
    end
  end

  def update
    if @user.update(user_params)
      redirect_to(profile_path, notice: 'Profile updated')
    else
      redirect_to(profile_path, error: 'Error')
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :authentications_attributes)
    end
end
