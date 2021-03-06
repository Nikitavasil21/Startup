class ProfilesController < ApplicationController

  def edit
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to(root_path, notice: "Update successfully")
    else
      redirect_to(edit_profiles_path, error: "Something went wrong")
    end
  end

  def set_current_deck  
    if current_user.update_attributes(current_deck_id: params[:deck_id])
      flash[:success] = "Current deck set!"
      redirect_to decks_path
    end
  end


  private
    def user_params
      params.require(:profile).permit(:email, :password, :password_confirmation, :current_deck_id)
    end
end
