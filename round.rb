require_relative 'deck'
class Round
  attr_accessor :deck
  attr_reader :bank

  def initialize(game)
    @deck = Deck.generate
    @bank = 0
    @game = game
  end

  def player_choice(choice)
    if choice.zero?
      dealer_choice
      player_choice(Interface.player_choice)
    end
    if choice == 1
      additional_distribution(@game.player)
      dealer_choice
      complete_the_round
    end
    complete_the_round if choice == 2
  end

  def initial_distribution
    2.times { @game.player.cards << deck.delete(deck.sample) }
    2.times { @game.dealer.cards << deck.delete(deck.sample) }
  end

  def additional_distribution(player)
    player.cards << @deck.delete(@deck.sample)
  end

  def dealer_choice
    return if @game.dealer.cards_count > 2

    additional_distribution(@game.dealer) if @game.dealer.score < 17
  end

  def bet
    @game.player.balance -= Game::ROUND_BET
    @game.dealer.balance -= Game::ROUND_BET
    @bank = Game::ROUND_BET * 2
  end

  def distribution_bet(result)
    send result
  end

  def win
    @game.player.balance += @bank
  end

  def defeat
    @game.dealer.balance += @bank
  end

  def draw
    @game.player.balance += Game::ROUND_BET
    @game.dealer.balance += Game::ROUND_BET
  end

  def complete_the_round
    Interface.show_player_cards(@game.player)
    Interface.show_player_cards(@game.dealer)
    distribution_bet(result_round)
    Interface.result_round(result_round, @game.player.balance)
  end

  def result_round
    return :defeat if (@game.player.score > 21) || (@game.player.score < @game.dealer.score && @game.dealer.score < 22)
    return :draw if @game.player.score == @game.dealer.score

    :win
  end
end
