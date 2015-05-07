class ProfileController < ApplicationController

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to(profile_path, notice: "Update successfully")
    else
      redirect_to(profile_path, error: "Something went wrong")
    end
  end

  private
    def user_params
      params.require(:profile).permit(:email, :password, :password_confirmation)
    end
end
