FactoryGirl.define do
 
  factory :user do
    email "dodge@bk.ru"
    password "1234567890"
    password_confirmation "1234567890"
    current_deck_id 1
  end
end