class ProfileController < ApplicationController
  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      flash[:notice] = "User was successfully update"
      redirect_to edit_profile_path
    else
      flash[:error] = "Something went wrong"
    end
  end
end
