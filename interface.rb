
module Interface
  module_function
  def ask_player_name
    puts 'Введи свое имя:'
    gets.chomp
  end

  def show_player_cards(game)
    puts "Player cards: #{game.player.show_cards} Score: #{game.player.score}"
  end

  def show_dealer_cards(game)
    puts "Dealer cards: #{game.dealer.show_cards} #{game.dealer.score}"
  end

  def hide_dealer_cards
    puts "Dealer cards: * *"
  end

  def player_choice
    puts 'Сделай выбор: 0 - пропустить ход, 1 - добавить карту, 2 - открыть карты'
    gets.chomp.to_i
  end

  def bet
    puts "Ставка сделана, Ваш баланс"
  end

end
