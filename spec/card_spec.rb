require 'card'
require 'rspec'

describe "Card#initialize" do
   subject(:ace_spades) { Card.new(:spades, :A) }

   it "initializes the card with the correct suit and card type" do
      expect(ace_spades.suit).to eq(:spades)
      expect(ace_spades.type).to eq(:A)

   end



end