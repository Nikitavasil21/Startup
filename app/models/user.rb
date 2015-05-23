class User < ActiveRecord::Base

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :decks

  belongs_to :current_deck, class_name: "Deck"
  
  validate :current_deck_belongs_to_decks, on: :set_current_deck

  def current_deck_belongs_to_deck
    if decks.include?(deck.find(current_deck_id))
      errors.add(:current_deck, "Deck id and current deck id cant be different" ) 
    end
  end

  def cards_for_review
    if current_deck_id
      current_deck.cards.for_review
    else
      cards.for_review
    end
  end


  has_many :cards, through: :decks

  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :email, uniqueness: true

  with_options unless: "password.nil?" do
    validates :password, length: { minimum: 10 }
    validates :password, confirmation: true
    validates :password_confirmation, presence: true
  end
end
