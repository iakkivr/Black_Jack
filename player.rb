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
    calculate_score
  end

  def cards
    @cards ||= []
  end

  def cards_count
    @cards.count
  end

  def show_cards
    @cards.map(&:picture)
  end

  protected

  def count_ace
    count = 0
    cards.each do |card|
      count += 1 if card.ace?
    end
    count
  end

  def combination_aces
    result = []
    ([1, 11] * count_ace).combination(count_ace).to_a.map(&:sum).uniq.each do |elem|
      result << elem + calculate_without_ace
    end
    result
  end

  def calculate_score
    combination_aces

    points = 0
    combination_aces.sort!.each_with_index do |elem, index|
      return elem if elem > 21 && index.zero?
      return points if elem > 21

      points = elem
    end
    points
  end

  def calculate_without_ace
    result = []
    @cards.map { |card| result << card.points unless card.ace? }
    result.flatten.sum
  end
end

game = Game.new
game.new_round
