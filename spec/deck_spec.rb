require 'deck'
require 'rspec'

describe Deck do
   subject(:test_deck) { Deck.new }

   let(:full_deck) do
      {
         numbers: (2..10).to_a,
         pictures: [:A, :J, :Q, :K]

      }

   end
end

