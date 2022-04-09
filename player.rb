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
    print @cards.map(&:points)
    puts ''
    @cards.count
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
    result
  end

  def calculate_value_with_ace
    result = ([1,11] * count_ace).combination(count_ace).to_a.map(&:sum).uniq
                                 .concat(calculate_value).flatten.filter(&:positive?)
     result.combination(@cards.count).to_a.map(&:sum)
  end

end


game = Game.new
game.controller
