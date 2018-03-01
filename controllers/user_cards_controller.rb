module UserCardsController

  def user_cards_index_action
    response = Unirest.get("http://localhost:3000/user_cards")
    cards = response.body

    user_cards_index_view(cards)

    print "Would you like to add another card [1], remove a card [2], view one of your cards [3],  or continue [enter]: "
    cards_choice = gets.chomp

    user_cards_decision(cards_choice)
  end


  def user_cards_decision(cards_choice)
    if cards_choice == '1'
      card_create_action
    elsif cards_choice == '2'
      user_card_destroy_action
    elsif cards_choice == '3'
      user_card_show_action
    end
  end

  def user_card_show_action
    print "Enter the ID of your card: "
    input_id = gets.chomp
    response = Unirest.get( "http://localhost:3000/user_cards/#{input_id}")
    user_card = response.body

    response = Unirest.get("http://localhost:3000/cards/#{input_id}")
    card = response.body

    user_card_show_view(user_card, card)
  end

  def user_card_create_action(card)
    client_params = {}
    puts "What condition is it in? "
    client_params[:condition] = gets.chomp

    puts "What is the Print Tag? "
    client_params[:print_tag] = gets.chomp
    client_params[:card_id] = card["id"]

    response = Unirest.post(
                            "http://localhost:3000/user_cards",
                            parameters: client_params
                            )
    user_card = response.body
    user_cards_create_view(user_card)
  end

  def user_card_update_action
    response = Unirest.get("http://localhost:3000/user_cards")
    cards = response.body
    
    puts "    Your Cards:"
    cards.each do |card|
      puts "=" * 50
      puts "Card ID: #{card["id"]}"
      puts "Card Name: #{card["name"]}"
      puts
    end
    print "Which card would you like to get edit (ID:)? "
    input_id = gets.chomp
    
    if input_id != ""
      card_update_action(input_id)
    end
  end

  def user_card_destroy_action
    response = Unirest.get("http://localhost:3000/user_cards")
    cards = response.body
    
    puts "    Your Cards:"
    cards.each do |card|
      puts "=" * 50
      puts "Card ID: #{card["id"]}"
      puts "Card Name: #{card["name"]}"
      puts
    end
    print "Which card would you like to get rid of (ID:)? "
    input_id = gets.chomp

    if input_id != ""
    response = Unirest.delete("http://localhost:3000/user_cards/#{input_id}")

    json_data = response.body
    puts json_data["message"]
    end
  end

end





