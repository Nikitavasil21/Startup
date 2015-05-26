class DecksController < ApplicationController

  def index
    @decks = current_user.decks.all
  end

  def create
    if @deck = current_user.decks.new(deck_params)
    @deck.save
      redirect_to decks_path, notice: "Successfully created"
    end
  end

  private
    def deck_params
      params.require(:deck).permit(:name)
    end
end
