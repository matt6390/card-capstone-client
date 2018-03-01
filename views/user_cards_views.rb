module UserCardsViews
  def user_cards_index_view(cards)
    cards.each do |card|
      puts
      puts "#{card["id"]}"
      puts "Card Name: #{card["name"]}"
      puts "-" * 80
      puts "Card Description: #{card["description"]}"
      puts "Card Element: #{card["element"]}"
      puts "Card Attribute: #{card["race"]}"
      puts "Card Rarity: #{card["rarity"]}"
      puts
    end
  end

  def user_card_show_view(user_card, card)
    # p user_card[0]
    # p card
    puts
    puts "=" * 50
    puts "Card Name: #{card["name"]}"
    puts "-" * 50
    puts "Card Description: #{card["description"]}"
    puts "Card Element: #{card["element"]}"
    puts "Card Attribute: #{card["race"]}"
    puts "Card Rarity: #{card["rarity"]}"
    puts "Card Condition: #{user_card[0]["condition"]}"
    puts "Print Tag: #{user_card[0]["print_tag"]}"
  end

  def user_cards_create_view(user_card)
    # p user_card
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

end



