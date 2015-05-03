FactoryGirl.define do
 
  factory :user do
    password "1234567890"
    password_confirmation "1234567890"
    email "dodge@bk.ru"
    id 1
  end
end