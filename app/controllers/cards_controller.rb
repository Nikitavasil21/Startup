class CardsController < ApplicationController
  def index
   @cards = Card.all
  end

  def destroy
     @card = Card.find(params[:id])
     @card.destroy
       redirect_to cards_path
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  def show
    @card = Card.find(params[:id])  
  end

  def new
    @card = Card.new(card_params)
  end

  def edit
    @card = Card.find(params[:id])
  end
  
  def create
    @card = Card.new
    if @card.save
      redirect_to @card
    end
  end
end
  
private

  def card_params
    params.fetch(:card, {}).permit(:original, :translated)
  end