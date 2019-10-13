require 'hand'
require 'rspec'

describe Hand do
   let(:no_pair_hand) do
      [
         double(:value => 5, :suit => :hearts),
         double(:value => 10, :suit => :clubs),
         double(:value => :A, :suit => :spades),
         double(:value => 3, :suit => :diamonds),
         double(:value => :J, :suit => :hearts)
      ]
   end

   describe "#initialize" do
      new_hand = Hand.new(no_pair_hand)
      it "Takes an array of cards and creates a hand"

      it "Raises an error unless 5 cards are provided" 
   end
   



end