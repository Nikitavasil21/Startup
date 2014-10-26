class CardsController < ApplicationController
  def index
   @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])  
  end

  def new
  end

  def edit
    @card = Card.find(params[:id])
  end
  
  def create
    @card = Card.new

    if @card.save
       redirect_to @card
  end

  def update
    @card = Card.find(params[:id])
    if
    @card.update
      redirect_to @cards
  end
end
  def destroy
    @card = Card.find(params[:id])
    @cards.destroy
    
    redirect_to cards_path
  end   
end
end   