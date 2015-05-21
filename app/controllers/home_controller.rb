class HomeController < ApplicationController
  def index
    if current_user.current_deck.present?
      @card = current_user.current_deck.cards.for_review.first
    else
      @card = current_user.cards.for_review.first
    end
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