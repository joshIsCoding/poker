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
   



end