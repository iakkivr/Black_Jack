
module Interface
  module_function
  def ask_player_name
    puts 'Введи свое имя:'
    'Vitalik' #gets.chomp
  end

  def show_player_cards(game)
    puts "Player cards: #{game.player.show_cards} Score: #{game.player.score}"
  end

  def show_dealer_cards(game)
    puts "Dealer cards: #{game.dealer.show_cards} "
  end

  def hide_dealer_cards
    puts "Dealer cards: * *"
  end


end
