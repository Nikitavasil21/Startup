require "rails_helper"

describe Card do
  it "Check translation of the card in the different register" do 
    card = Card.create(original: "cherry", translated: "Вишня", review_date: "2015-04-10 00:00:00 UTC", deck_id: 1)
    expect(card.check_translation("CheRrY")).to be true
  end

  it "Returns false for incorrect translation" do
    card = Card.create(original: "Hoogie code", translated: "Говнокод", review_date: "2015-04-10 00:00:00 UTC", deck_id: 1)
    expect(card.check_translation("Shit")).to be false
  end

  context "The translation is true" do
    let(:card) {Card.create(original: "Hoogie code", translated: "Говнокод", review_date: "2015-04-28 00:00:00 UTC", deck_id: 1)}
    it "The translation is true" do
      expect(card.check_translation("Hoogie code")).to be true
    end
  
    it "Cheking the changing of review_date" do
      expect { card.check_translation("Hoogie code") }.to change { card.review_date }.from("2015-04-28 00:00:00 UTC").to(Date.today + 3.days)
    end
  end 
end