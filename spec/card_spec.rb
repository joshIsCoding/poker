require 'card'
require 'rspec'

describe Card do
   describe "Card#initialize" do
      subject(:ace_spades) { Card.new(:spades, :A) }

      it "initializes the card with the correct suit and card type" do
         expect(ace_spades.suit).to eq(:spades)
         expect(ace_spades.type).to eq(:A)

      end
   end

   describe "Card#to_s" do 
      it "returns the correct unicode suit and value for each card" do
         expect(ace_spades.to_s).to eq("A♤")
      end

   end
   

   
end