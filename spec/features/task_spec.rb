require "rails_helper"

describe "Check the verify of the form" do

let!(:card) { create (:card)}

  before do
    card.update_attribute(:review_date, Date.today - 1.day)
    visit root_path
  end

  it "Check the true translation of the card" do
    fill_in :user_translation, with: "Hoogie code"
    click_button "Проверка"
    expect(page).to have_content("Fuck yeah!")
  end

  it "Check the false translation of the card" do
    fill_in :user_translation, with: "Copro Code"
    click_button "Проверка"
    expect(page).to have_content("Try again,bro!")
  end
end