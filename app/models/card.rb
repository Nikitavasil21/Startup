class Card < ActiveRecord::Base
  belongs_to :user
  validates :original, :translated, :review_date, :user_id, presence: true
  scope :for_review, -> {
    where("review_date <=?", DateTime.now).order("RANDOM()")
  }

  def check_translation(user_translation)
    if original.mb_chars.downcase.strip == user_translation.mb_chars.downcase.strip
      update_attributes(review_date: Date.today + 3.days)
    else
      false
    end
  end  
end
