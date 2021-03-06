class CardsController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]
  before_action :require_login



  def index
    @cards = current_user.cards.all
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  def new
    @card = Card.new
  end
  
  def create
    @card = current_user.cards.new(card_params)
    @card.save
    redirect_to cards_path
  end

  private

    def find_card
      @card = current_user.cards.find(params[:id])
    end

    def card_params
      params.require(:card).permit(:original, :translated, :review_date, :picture, :deck_id)
    end
end
