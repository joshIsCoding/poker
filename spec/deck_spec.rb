require 'deck'
require 'rspec'

describe Deck do
   subject(:test_deck) { Deck.new }
   let(:all_cards) { cards = test_deck.cards }
   

   describe "#initialize" do
      let(:custom_deck_arr) do
      [
         double(:value => 5, :suit => :hearts),
         double(:value => 10, :suit => :clubs),
         double(:value => :A, :suit => :spades),
         double(:value => :J, :suit => :hearts),
      ]
   end
      it "Creates an array of a full set of playing cards" do
         expect(all_cards.count).to eq(52)
         expect(all_cards.uniq).to eq(all_cards)
      end

      it "Accepts a custom deck of cards as an argument" do
         expect(Deck.new(custom_deck_arr).cards).to eq(custom_deck_arr)
      end
   end

   describe "give" do
      it "Returns cards from the deck according to the number provided as an argument" do
         expect(test_deck.give(3).count).to eq(3) 
      end


      it "Removes the cards from the deck with each deal" do
         removed = test_deck.give(1)
         expect(test_deck).not_to include(removed)
         expect(test_deck.cards.count).to eq(51)

      end

      it "Returns an error if there are insufficient cards in the deck" do
         expect{test_deck.give(53)}.to raise_error("Insufficient cards in deck")
      end
   end

   describe "#take_back" do
      let(:card_1) {double(:value => 4, :suit => :diamonds)}
      it "Adds the argument card to the deck"

      it "Does not put the card at the top of the deck"

   end

   describe "#shuffle" do
      
      it "Shuffles the deck"

   end

   describe "#deal_hand" do 
      it "deals 5 cards from the deck" 
   end



end

