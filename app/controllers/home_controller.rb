class HomeController < ApplicationController
  def index
    @card = Card.for_review.first
  end

  def review_card
    @card = Card.find(translation_params[:id])
    if @card.check_translation(translation_params[:user_translation])
      flash[:success] = "Fuck yeah!"
    else
      flash[:error] = "Try again,bro!"
    end
    redirect_to root_path
  end
  private
    def translation_params
      params.permit(:id, :user_translation)
    end
end  