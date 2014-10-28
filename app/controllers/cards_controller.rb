class CardsController < ApplicationController
  before_action :card_find, only: [:show, :edit, :update, :destroy]

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
    if @card.save
      redirect_to cards_path
    end
  end

  protected
    def card_find
      @card = Card.find(params[:id])
    end

  private

  def card_params
    params.require(:card).permit(:original, :translated, :review_date) if params[:card]
  end
end
