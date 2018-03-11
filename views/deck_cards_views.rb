module DeckCardsViews
  def deck_card_create_view(card)
    puts 
    puts "You added #{card["card"]["name"]} to the deck list."
  end
end