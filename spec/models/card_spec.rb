require "rails_helper"

describe Card do
  it "Check translation of the card" do 
    card = Card.create(original: "cherry", translated: "Вишня", review_date: "2015-04-10 00:00:00 UTC")
    expect(card.check_translation("CheRrY")).to be true
  end
  it "Checking the simple example" do
    card = Card.create(original: "Hoogie code", translated: "Говнокод", review_date: "2015-04-10 00:00:00 UTC" )
    expect(card.check_translation("Hoogie code")).to be true
  end 
  it "Returns false for incorrect translation" do
    card = Card.create(original: "Hoogie code", translated: "Говнокод", review_date: "2015-04-10 00:00:00 UTC")
    expect(card.check_translation("Shit")).to be false
  end

  it "Cheking the changing of review_date" do
    card = Card.create(original: "Hoogie code", translated: "Говнокод", review_date: "2015-04-27 00:00:00 UTC")
    expect(card.check_translation("Hoogie code")).to be true
    expect(card.review_date).to eq("2015-04-30 00:00:00 UTC")
  end 
end