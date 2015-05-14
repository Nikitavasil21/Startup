class ProfilesController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to(root_path, notice: "Update successfully")
    else
      redirect_to(edit_profile_path, error: "Something went wrong")
    end
  end

  private
    def user_params
      params.require(:profile).permit(:email, :password, :password_confirmation)
    end
end
