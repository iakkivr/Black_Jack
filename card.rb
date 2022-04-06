class Card
  SUITS = %w[♠ ♥ ♣ ♦].freeze
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze

  attr_reader :value, :suit


  def initialize(suit, value)
    @value = value
    @suit = suit
  end

  def picture?
    %w[J Q K].include? value
  end

  def ace?
    %w[A].include? value
  end

  def cost
    return 11 if ace?
    return 10 if picture?
    value
  end
end

