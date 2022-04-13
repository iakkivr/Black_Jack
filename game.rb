require_relative 'interface'
require_relative 'round'

class Game
  DEFAULT_BALANCE = 100
  ROUND_BET = 10
  DEALER_PASSING_SCORE = 17

  attr_reader :dealer, :player

  def initialize
    @round = Round.new(self)
    adding_players
  end

  def controller
    Interface.show_player_cards(@player)
    Interface.hide_dealer_cards
    @round.bet
    Interface.bet(player.balance)
    @round.player_choice(Interface.player_choice)
    Interface.player_choice_game == 1 ? self.new_round : Interface.goodbye(@player)
  end

  def new_round
    player.cards.clear
    dealer.cards.clear
    @round = Round.new(self)
    @round.initial_distribution
    self.controller
  end

  private

  def adding_players
    @player = User.new(Interface.ask_player_name)
    @dealer = User.new("Dealer")
  end

end

