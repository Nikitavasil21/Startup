require "rails_helper"

describe "Check decks validation" do
  let!(:card) { FactoryGirl.create (:card) }
  let!(:user) { FactoryGirl.create (:user) }
  let!(:deck) { FactoryGirl.create (:deck) }


  before do
    login("dodge@bk.ru", "1234567890")
    card.update_attribute(:review_date, Date.today - 1.day)
  end

  it "Check deck and card validation" do
    visit home_path
    expect(page).to have_content("Govnocode")
  end
end