module YuGiOhViews
  def yugioh_name_price_view(card, card_name)
    p card
    puts
    puts "=" * 50
    puts "#{card_name}: from the #{card["name"]}"
    puts "Print Tag: #{card["print_tag"]}"
    puts "Market Highest Price: $#{card["price_data"]["data"]["prices"]['high']}"
    puts "Market Average Price: $#{card["price_data"]["data"]["prices"]['average']}"
    puts "Market Lowest Price: $#{card["price_data"]["data"]["prices"]["low"]}"
    puts "Card Rarity: #{card['rarity']}"
  end
end