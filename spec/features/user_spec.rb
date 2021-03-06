require "rails_helper"


describe "Check updating of user and card validations" do
  let! (:user) { FactoryGirl.create(:user) }
  let (:card) { FactoryGirl.create(:card) }

  context "Check user updating" do

    before (:each) do
      login("dodge@bk.ru", "1234567890")
    end

    it "Check user profile updating" do
      fill_in :profile_email, with: "dodge@bk.ru"
      fill_in :profile_password, with: "1234567891"
      fill_in :profile_password_confirmation, with: "1234567891"
      click_button "Save Profile"
      expect(page).to have_content("Update successfully")
    end
  end

  context "Check user registration" do

    before (:each) do
     visit root_path
     click_link "Register"
    end
 

    it "Check registration" do
      fill_in :user_email, with: "dodge@mail.ru"
      fill_in :user_password, with: "1234567890"
      fill_in :user_password_confirmation, with: "1234567890"
      click_button "Create User"
      expect(page).to have_content("User was successfully created")
    end
  end
end