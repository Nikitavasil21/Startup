class Card < ActiveRecord::Base
validates :original,
          :translated,
          :review_date,
          presence: true

  scope :for_review, -> {
    where("review_date <=?", DateTime.now).order("RANDOM()")
  }

  def check_translation(user_translation)
    if original.mb_chars.downcase == user_translation.mb_chars.downcase
      update_attributes(review_date: Date.today + 3.days)
    else
      false
    end
  end  
  
end
