class HomeController < ApplicationController
  def index
    @card = Card.task_cards
  end

  def task
    user_translation = params[:user_translation]
    if @card.task_checking
      flash[:notice] = "Fuck yeah!"
    else
      flash[:error] = "Try again,bro!"
    end
    redirect_to root_path
  end
end  