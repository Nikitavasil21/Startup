class Card < ActiveRecord::Base
validates :original, :translated, :review_date, presence: true

  scope :task_cards, -> {
    where("review_date <=?", DateTime.now).order("RANDOM()")
  }

  def task_checking(user_translation)
    if original.mb_chars.downcase == user_translation.mb_chars.downcase
      update_attributes(review_date: Date.today + 3.days)
    end
  end  
  
end
