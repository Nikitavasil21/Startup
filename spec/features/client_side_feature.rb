describe "check views" do

  context "Check login path" do
    it "Doesnt show users actions for logout users" do
      visit root_path
      expect(page).not_to have_content("All cards" )
    end

    it "Should be navbar for logout users" do
      visit root_path
      expect(page).to have_content("Login with Twitter")
    end
  end
end