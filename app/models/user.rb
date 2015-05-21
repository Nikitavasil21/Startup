class User < ActiveRecord::Base

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :decks

  belongs_to :current_deck, class_name: "Deck"

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
