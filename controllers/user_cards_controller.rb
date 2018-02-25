module UserCardsController

  def user_cards_index_action
    response = Unirest.get("http://localhost:3000/user_cards")
    cards = response.body

    user_cards_index_view(cards)

    print "Would you like to add another card [1], remove a card [2], or continue [enter]: "
    cards_choice = gets.chomp

    user_cards_decision_action(cards_choice, cards)
  end

  def user_cards_decision_action(cards_choice, cards)
    if cards_choice == '1'
      card_create_action
    elsif cards_choice == '2'
      user_card_destroy_action
    else
        
    end
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
    user_cards_show_view(user_card)
  end

  def user_card_destroy_action
    response = Unirest.get("http://localhost:3000/user_cards")
    cards = response.body
    
    cards.each do |card|
      puts "=" * 50
      puts "Card ID: #{card["id"]}"
      puts "Card Name: #{card["name"]}"
      puts
    end
    print "Which card would you like to get rid of (ID:)? "
    input_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/user_cards/#{input_id}")

    json_data = response.body
    puts json_data["message"]
  end

end





