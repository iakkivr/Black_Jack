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
    player_choice(Interface.player_choice)
    Interface.show_player_cards(self)
    Interface.show_dealer_cards(self)
  end

  def player_choice(choice)
    dealer_choice if choice == 0 #пропустить ход
    if choice == 1 #добавить карту
      additional_distribution(@player)
      dealer_choice
    end
    if choice == 2 #открыть карты
      dealer_choice
      complete_the_round
    end
  end

  def complete_the_round
    Interface.show_player_cards(self)
    Interface.show_dealer_cards(self)
    puts result_round
  end

  def result_round
    return :defeat if player.score > 21 or player.score < dealer.score
    return :draw if player.score == dealer.score
    :win
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

  def dealer_choice
    additional_distribution(@dealer) if @dealer.score < 17
  end
end

