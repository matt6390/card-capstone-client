module CardsViews

  def cards_index_view(cards)
    cards.each do |card|
      card_show_view(card)
    end
  end

  def card_show_view(card)
    puts
    puts "Card Name: #{card["name"]} (ID: #{card["id"]})"
    puts "-" * 80
    puts "Card Description: #{card["description"]}"
    puts "Card Element: #{card["element"]}"
    puts "Card Attribute: #{card["race"]}"
    puts "Card Rarity: #{card["rarity"]}"
    puts
    puts
  end
end