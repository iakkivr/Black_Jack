module Interface
  module_function

  def ask_player_name
    puts 'Введи свое имя:'
    gets.chomp
  end

  def round_bet(player)
    puts "Ставка сделана. Ваш баланс: #{player.balance}"
  end

  def show_player_cards(player)
    puts "#{player.name} cards: #{player.show_cards} Score: #{player.score}"
  end

  def result_round(result, balance)
    send result, balance
  end

  def defeat(balance)
    puts "К сожалению, вы проиграли. Попробуйте еще раз. Ваш баланс: #{balance}"
  end

  def draw(balance)
    puts "Ничья. В следующий раз получится. Ваш баланс: #{balance} "
  end

  def win(balance)
    puts "Вы одержали победу! Ваш баланс: #{balance}"
  end

  def hide_dealer_cards
    puts 'Dealer cards: * *'
  end

  def goodbye
    'Благодарю за игру! Возвращайся!'
  end

  def player_choice
    puts 'Сделай выбор: 0 - пропустить ход, 1 - добавить карту, 2 - открыть карты'
    gets.chomp.to_i
  end

  def player_choice_game
    puts 'Сделай выбор: 1 - сыграть еще раз, 0 или любой символ - завершить игру'
    gets.chomp.to_i
  end

  def bet(balance)
    puts "Ставка сделана, Ваш баланс: #{balance} "
  end
end
