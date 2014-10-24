class CardsControllerController < ApplicationController
  def index
   @cards = Card.all
  end

  def show
   @cards = Card.find(params[:id])
  end

  def new
  end
 end
