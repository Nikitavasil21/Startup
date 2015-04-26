require "rails_helper"

RSpec.describe Card, :type => :model do
  it "Check translation of the card" do
    card = Card.new(original: "Lolio", translated: "Lolka", review_date: "2015-04-10 00:00:00 UTC")
    expect(card.check_translation("Lolio")).to be true
  end 
end