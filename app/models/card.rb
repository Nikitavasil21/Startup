class Card < ActiveRecord::Base
  belongs_to :deck

  has_attached_file :picture, styles: { medium: "360x360" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates :original, :translated, :review_date, :deck_id, presence: true

  
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
