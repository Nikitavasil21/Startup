require "rails_helper"


describe "Check the verify of the form" do

  let!(:card) { FactoryGirl.create (:card) }
  let!(:user) { FactoryGirl.create (:user) }
  let!(:deck) { FactoryGirl.create (:deck) }
  before (:each) do
    login("dodge@bk.ru", "1234567890")
    card.update_attribute(:review_date, Date.today - 1.day)
    click_link "Main"
  end

  it "Check the true translation of the card" do
    fill_in :user_translation, with: "Hoogie"
    click_button "Проверка"
    expect(page).to have_content("Fuck yeah!")
  end

  it "Check the false translation of the card" do
    fill_in :user_translation, with: "Copro Code"
    click_button "Проверка"
    expect(page).to have_content("Try again,bro!")
  end
end