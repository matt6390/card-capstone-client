module DeckCardsController
  def deck_card_create_action(deck_id)
    # p deck_id
    client_params = {}
    client_params[:deck_id] = deck_id

    response = Unirest.get("http://localhost:3000/user_cards")
    cards = response.body
    user_cards_index_view(cards)
    print "Which card would you like to add to this deck? "
    client_params[:card_id] = gets.chomp

    response = Unirest.post(
                            'http://localhost:3000/deck_cards',
                            parameters: client_params
                            )
    deck_card = response.body
    p deck_card
    deck_card_create_view(card)
  end

  def deck_card_delete_action(card_id)
    p card_id

    response = Unirest.delete("http://localhost:3000/deck_cards/#{card_id}")
    data = response.body
    puts data["message"]

  end
end



