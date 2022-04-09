require_relative 'interface'
#require_relative 'player'

class Game
  DEFAULT_BALANCE = 100
  ROUND_BET = 10
  DEALER_PASSING_SCORE = 17

  attr_reader :dealer, :player

  def initialize
    @dealer_balance = DEFAULT_BALANCE
    @players = []
  end

  def controller
    @round = Round.new
    adding_players
    initial_distribution
    Interface.show_player_cards(self)
    Interface.hide_dealer_cards
    round_bet
    additional_distribution(@player)
    Interface.show_player_cards(self)

  end



  private
  def round_bet
    @player.balance -= ROUND_BET
    @dealer.balance -= ROUND_BET
  end

  def adding_players
    @player = User.new(Interface.ask_player_name)
    @dealer = User.new("Dealer")
  end

  def initial_distribution
    2.times { @player.cards << @round.deck.delete(@round.deck.sample) }
    2.times { @dealer.cards << @round.deck.delete(@round.deck.sample) }
  end
  def additional_distribution(player)
    player.cards << @round.deck.delete(@round.deck.sample)
  end
end

