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
      
      it "Takes an array of cards and creates a hand"  do
         new_hand = Hand.new(no_pair_hand)
         expect(new_hand.cards.count).to eq(5)
      end

      it "Raises an error unless 5 cards are provided" do
         reduced_hand = no_pair_hand[0..2]
         expect(Hand.new(reduced_hand)).to raise_error("Insufficient cards to initialize hand")
      end
   end
   
   describe "#discard" do
      let(:discard_hand) { Hand.new(no_pair_hand) }
      let(:targets) { [0, 2, 3]}

      it "Returns cards based on an argument array of the target indices" do
         expect(discard_hand.discard(targets)).to include(no_pair_hand[0], no_pair_hand[2], no_pair_hand[3])
      end

      it "Removes the cards from the hand" do
         discard_hand.discard(targets)
         expect(discard_hand.cards).to_not include(no_pair_hand[0], no_pair_hand[2], no_pair_hand[3])
      end

   end

   describe "#receive" do
      let(:two_cards_short) do
         receive = Hand.new(no_pair_hand)
         receive.discard([1,4])
      end

      let(:one_new_card) { double(:value => :J, :suit => :hearts) }

      let(:two_new_cards) do
         [ 
            double(:value => :A, :suit => :diamonds),
            double(:value => :K, :suit => :diamonds)
         ]
      end


      it "Adds the cards present in the argument array to the hand" do
         full_hand = two_cards_short.receive(two_new_cards)
         expect(full_hand).to include(*two_new_cards)
      end

      it "Raises an error if the new hand were to fall short of or exceed 5 cards" do
         expect(two_cards_short.receive(one_new_card)).to raise_error("Incomplete hand")
         expect(two_cards_short.receive(one_new_card + two_new_cards)).to raise_error("Incomplete hand")
      end


   end

   describe "#best_hand" do

      it "Returns a symbol representing the type of poker hand possible from the available cards"

      it "Correctly identifies the strongest possible hand when several types are possible"

   end

   describe "#<=>" do

      it "Returns 1 for hands of higher rank"

      it "Returns -1 for hands of lower rank"

      it "Returns 0 for identical hands"
   end

   describe "::winning_hand" do
      it "Returns the winning hand from an array of input hands"

   end

end