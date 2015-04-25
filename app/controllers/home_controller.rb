class HomeController < ApplicationController
  def index
    @card = Card.task_cards.first
  end

  def task
    @card = Card.find(params_task[:id])
    if @card.task_checking(params_task[:user_translation])
      flash.now[:success] = "Fuck yeah!"
    else
      flash.now[:error] = "Try again,bro!"
    end
    redirect_to root_path
  end

  private
    def params_task
      params.permit(:id,:user_translation)
    end
end  