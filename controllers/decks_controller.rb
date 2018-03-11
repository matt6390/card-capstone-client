module DecksController
  def decks_index_action
    response = Unirest.get('http://localhost:3000/decks')
    decks = response.body
    # p decks 
    decks_index_view(decks)
    print "Would which deck would you like to look at: "
    deck_id = gets.chomp
    if deck_id != ""
      deck_show_action(deck_id)
    end
  end

  def deck_show_action(deck_id)
    response = Unirest.get("http://localhost:3000/decks/#{deck_id}")
    deck = response.body
    # p deck
    deck_cards_view(deck)
  end

  def deck_add_card_action
    response = Unirest.get('http://localhost:3000/decks')
    decks = response.body
    # p decks 
    decks_index_view(decks)
    print "Enter the ID of the deck you'd like to add to: "
    deck_id = gets.chomp

    if deck_id != ""
      deck_show_action(deck_id)
      print "Is this the deck you'd like to add too? ('y' or 'n'): "
      input_option = gets.chomp

      if input_option == 'y'
        deck_card_create_action(deck_id)
      end
    end


  end

  def deck_create_action
    client_params = {}

    print "What is the name of your deck: "
    client_params[:name] = gets.chomp
    if client_params[:name] != ""
      print "Enter a description of what will be in the deck: "
      client_params[:info] = gets.chomp

      response = Unirest.post(
                              'http://localhost:3000/decks',
                              parameters: client_params
                              )
      deck = response.body
      # p deck

      deck_show_view(deck)
    end
  end
  
end










