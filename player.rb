require_relative 'game'
require_relative 'card'
require_relative 'deck'
require_relative 'round'
class User
  attr_reader :name
  attr_accessor :balance
  def initialize(name)
    @name = name
    @balance = Game::DEFAULT_BALANCE
  end

  def score
    calculate_value_with_ace
  end

  def count_ace
    count = 0
    cards.each do |card|
      count += 1 if card.ace?
    end
    count
  end

  def cards
    @cards ||= []
  end

  def show_cards
    @cards.map(&:picture)
  end

  def calculate_value
    result = []
    @cards.map { |card| result << card.cost unless card.ace? }
    result.flatten.sum
  end

  def calculate_value_with_ace
    result = []
    @cards
    points_without_aces = calculate_value
   ([1,11] * count_ace).combination(count_ace).to_a.map(&:sum).uniq.each do |elem|
     result << elem + points_without_aces
   end
    result.sort.each do |elem|
      return result if elem > 21
      result = elem
    end
  #  не комбиинровать , а считать по очереди
  end

end


game = Game.new
game.controller
