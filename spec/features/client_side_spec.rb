require "rails_helper"

describe "check views" do
  let!(:card) { FactoryGirl.create (:card) }
  let!(:user) { FactoryGirl.create (:user) }
  let!(:deck) { FactoryGirl.create (:deck) }

  context "Check login path" do
    it "Doesnt show users actions for logout users" do
      visit root_path
      expect(page).not_to have_content("All Cards" )
    end

    it "Should be navbar for logout users" do
      visit root_path
      expect(page).to have_content("Login with Twitter")
    end
  end

  context "Check content for login user" do
    before do
      login("dodge@bk.ru", "1234567890")
    end

    it "Check the navbar for login users" do
      expect(page).to have_content("All Cards" )
    end

    it "Doesnt show for navbar for logout users to login users" do
      expect(page).not_to have_content("Login with Twitter")
    end

    it "Must show me current deck with my card" do
      visit root_path
      expect(page).to have_content("Govnocode")
    end
  end


end