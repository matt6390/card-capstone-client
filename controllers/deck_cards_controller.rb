module DeckCardsController
  def deck_card_create_action(deck_id)
    p deck_id
    client_params = {}
    client_params[:deck_id] = deck_id

    response = Unirest.get("http://localhost:3000/user_cards")
    cards = response.body
    user_cards_index_view(cards)
    print "Which card would you like to add to this deck? "
    client_params[:user_card_id] = gets.chomp

    response = Unirest.post(
                            'http://localhost:3000/deck_cards',
                            parameters: client_params
                            )
    deck_card = response.body

    p deck_card
  end
end