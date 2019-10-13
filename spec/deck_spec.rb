require 'deck'
require 'rspec'

describe Deck do
   subject(:test_deck) { Deck.new }
   let(:all_cards) { cards = test_deck.cards }
   let(:custom_deck_arr) do
      [
         double(:value => 5, :suit => :hearts),
         double(:value => 10, :suit => :clubs),
         double(:value => :A, :suit => :spades),
         double(:value => :J, :suit => :hearts)
      ]
   end

   describe "#initialize" do
      
   
      it "Creates an array of a full set of playing cards" do
         expect(all_cards.count).to eq(52)
         expect(all_cards.map{ |card| [card.value, card.suit] }.uniq.count).to eq(all_cards.count)
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
         expect(test_deck.cards).not_to include(removed)
         expect(test_deck.cards.count).to eq(51)

      end

      it "Returns an error if there are insufficient cards in the deck" do
         expect{test_deck.give(53)}.to raise_error("Insufficient cards in deck")
      end
   end

   describe "#take_back" do
      let(:small_deck) { Deck.new(custom_deck_arr)}
      let(:card_1) {double(:value => 6, :suit => :diamonds)}
      let(:cards_arr) { [double(:value => 2, :suit => :hearts), double(:value => 3, :suit => :hearts), double(:value => 4, :suit => :hearts)]}
      
      it "Adds the argument card to the deck" do
         small_deck.take_back([card_1])
         expect(small_deck.cards).to include(card_1)
         expect(small_deck.cards.count).to eq(5)

      end

      it "Adds multiple cards to the deck" do
         small_deck.take_back(cards_arr)
         expect(small_deck.cards.count).to eq(7)
         expect(small_deck.cards).to include(cards_arr[0])
         expect(small_deck.cards).to include(cards_arr[1])
         expect(small_deck.cards).to include(cards_arr[2])
      end




      it "Does not put the card at the top of the deck" do
         small_deck.take_back([card_1])
         expect(small_deck.give(1)).to_not be(card_1)
         small_deck.give(3) #give away all but the newly returned card
         expect(small_deck.cards.give(1)).to be(card_1)
      end


   end

   describe "#shuffle!" do
      let(:ordered_cards) { all_cards.dup }
      
      it "Shuffles the deck" do
         test_deck.shuffle!
         expect(test_deck.cards).to_not eq(ordered_cards)
         expect(test_deck.cards.count).to eq(ordered_cards.count)
      end

   end

   describe "#deal_hand" do 
      it "deals 5 cards from the deck" do
         hand = test_deck.deal_hand
         expect(hand.count).to eq(5)
         expect{test_deck.deal_hand}.to change{test_deck.cards.count}.by(-5)
      end
   end



end

