require_relative  'card'
module Deck
  module_function

  def generate
    Card::SUITS.map do |s|
      Card::VALUES.map do |v|
        Card.new(s,v)
      end
    end.flatten
  end
end



