module DecksViews
  def deck_show_view(deck)
    # p deck
    puts
    puts '=' * 50
    puts "Deck Id: #{deck["id"]}"
    puts "Deck Name: #{deck["name"]}"
    puts "Deck Price: #{deck["price"]}"
    puts "Info: #{deck["info"]}"
  end

  def deck_cards_view(deck)
    deck_show_view(deck)
    puts "Contains: "
    index = 0
    deck["cards"].each do |card|
      # p card
      puts "-" * 20
      puts "#{card["name"]}:  ID of #{deck["deck_cards"][index]["id"]}"
      index += 1
    end
  end

  def decks_index_view(decks)
    decks.each do |deck|
      deck_show_view(deck)
    end
  end
end