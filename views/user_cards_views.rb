module UserCardsViews
  def user_cards_index_view(cards)
    puts "Users Cards"
    puts "=" * 50
    cards.each do |card|
      p card
      puts "#{card["card"]["id"]}"
      puts "Card Name: #{card["card"]["name"]}"
      puts "-" * 80
      puts "Card Description: #{card["card"]["description"]}"
      puts "Card Element: #{card["card"]["element"]}"
      puts "Card Race: #{card["card"]["race"]}"
      puts "Card Rarity: #{card["card"]["rarity"]}"
      puts "Card Condition: #{card["card"]["user_card"]["condition"]}"
      puts "Print Tag: #{card["card"]["user_card"]["print_tag"]}"
      puts
    end
  end

  def user_card_show_view(card)
    # p card
    puts
    puts "=" * 50
    puts "Card Name: #{card["card"]["name"]}"
    puts "-" * 50
    puts "Card Description: #{card["card"]["description"]}"
    puts "Card Element: #{card["card"]["element"]}"
    puts "Card Attribute: #{card["card"]["race"]}"
    puts "Card Rarity: #{card["card"]["rarity"]}"
    puts "Card Condition: #{card["card"]["user_card"]["condition"]}"
    puts "Print Tag: #{card["card"]["user_card"]["print_tag"]}"
  end

  def user_cards_create_view(user_card)
    p user_card
    puts
    puts "=" * 50
    puts "Card Owner: #{user_card["user_name"]}"
    puts
    puts "Card Name: #{user_card["card_name"]}"
    puts "-" * 50
    puts "Card Description: #{user_card["card_description"]}"
    puts "Card Element: #{user_card["element"]}"
    puts "Card Attribute: #{user_card["race"]}"
    puts "Card Rarity: #{user_card["rarity"]}"
    puts "Card Condition: #{user_card["condition"]}"
    puts "Print Tag: #{user_card["print_tag"]}"
  end

  def user_cards_simple_view(cards)
     puts "    Your Cards:"
    cards.each do |card|
      # p card
      puts "=" * 50
      puts "Card ID: #{card["card"]["id"]}"
      puts "Card Name: #{card["card"]["name"]}"
      puts
    end
  end

end



