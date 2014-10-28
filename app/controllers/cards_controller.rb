class CardsController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
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
    @card = Card.new(card_params)
  end
  
  def create
    @card = Card.new
    @card.save
    redirect_to cards_path
  end

  private

    def find_card
      @card = Card.find(params[:id])
    end

    def card_params
      params.require[:card].permit(:original, :translated, :review_date) if params[:card]
    end
end
