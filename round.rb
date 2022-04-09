require_relative 'deck'
class Round
  attr_accessor :deck
  def initialize
    @deck = Deck.generate
  end

end
