class Card < ActiveRecord::Base


  scope :task_cards, -> {
    where("review_date <=?", DateTime.now).order("RANDOM()")
  }

  def self.task_checking(user_translation)
    original.mb_chars.downcase == user_translation.mb_chars.downcase
  end  

 
end
