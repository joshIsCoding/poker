require 'card'
require 'rspec'

describe Card do
   describe "Card#initialize" do
      subject(:ace_spades) { Card.new(:spades, :A) }

      it "initializes the card with the correct suit and card type" do
         expect(ace_spades.suit).to eq(:spades)
         expect(ace_spades.type).to eq(:A)

      end

      it "raises an error for invalid card values" do
         expect{Card.new(:forks, :J)}.to raise_error
         expect{Card.new(:clubs, :E)}.to raise_error
      end

   end

   describe "#<=>" do
      subject(:3_clubs) {Card.new(:clubs, 3)}
      let(:3_hearts) {Card.new(:hearts, 3)}
      let(:7_clubs) {Card.new(:hearts, 7)}
      it "returns 1 for higher value cards of the same suit" do
         expect(7_clubs <=> 3_clubs).to eq(1)
      end

      it "returns 1 for higher suited cards of the same value" do
         expect(3_hearts <=> 3_clubs).to eq(1)
      end

      it "returns -1 for lower value cards of the same suit" do
         expect(3_clubs <=> 7_clubs).to eq(-1)
      end

      it "returns 1 for lower suited cards of the same value" do
         expect(3_clubs <=> 3_hearts).to eq(-1)
      end

      it "returns 0 for cards of equal suit and value" do
         expect(3_clubs <=> 3_clubs.dup).to eq(0)
      end

   end

   describe "Card#to_s" do 
      it "returns the correct unicode suit and value for each card" do
         expect(ace_spades.to_s).to eq("A♤")
      end

   end
   

   
end