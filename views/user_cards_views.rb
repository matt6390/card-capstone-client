module UserCardsViews
  def user_cards_show_view(user_card)
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

  def user_cards_index_view(cards)
    cards.each do |card|
      puts "#{card["id"]}"
      puts "Card Name: #{card["name"]}"
      puts "-" * 80
      puts "Card Description: #{card["description"]}"
      puts "Card Element: #{card["element"]}"
      puts "Card Attribute: #{card["race"]}"
      puts "Card Rarity: #{card["rarity"]}"
      puts
      puts
    end
  end
end



