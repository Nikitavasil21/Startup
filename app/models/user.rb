class User < ActiveRecord::Base
  has_many :cards
  #запилил ассоциации
end
