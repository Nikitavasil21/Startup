class User < ActiveRecord::Base
  authenticates_with_sorcery!
  has_many :cards

  validates :password, length: { minimum: 10 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, uniqueness: true
end
