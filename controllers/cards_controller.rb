module CardsController
  def cards_show_action
    response = Unirest.get("http://localhost:3000/cards")
    cards = response.body

    puts JSON.pretty_generate(cards)
  end

  def cards_index_action
    print "Enter the ID of the card to see: "
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/cards/#{input_id}")
    card = response.body
    puts JSON.pretty_generate(card)
  end

  def card_create_action
    puts "Enter the following information to create a new card"

        client_params = {}

        print "Name: "
        client_params[:name] = gets.chomp

        print "Description: "
        client_params[:description] = gets.chomp

        print "Attribute: "
        client_params[:element] = gets.chomp

        print "Card Type: "
        client_params[:race] = gets.chomp

        print "Rarity: "
        client_params[:rarity] = gets.chomp

        response = Unirest.post(
                                "http://localhost:3000/cards",
                                parameters: client_params
                                )

        card = response.body

        puts JSON.pretty_generate(card)
  end

  def card_update_action
    print "Enter the ID of the card to update: "
    input_id = gets.chomp
    client_params = {}

    response = Unirest.get("http://localhost:3000/cards/#{input_id}")
    card_json = response.body


    print "Name (#{card_json["name"]}):"
    client_params[:name] = gets.chomp

    print "Description (#{card_json["description"]}): "
    client_params[:description] = gets.chomp

    print "Attribute (#{card_json["element"]}): "
    client_params[:element] = gets.chomp

    print "Card Type (#{card_json["race"]}): "
    client_params[:race] = gets.chomp

    print "Rarity (#{card_json["rarity"]}): "
    client_params[:rarity] = gets.chomp

    client_params.delete_if { |key, value| value.empty?}

    update_response = Unirest.patch(
                            "http://localhost:3000/cards/#{input_id}",
                            parameters: client_params
                            )

    card = update_response.body

    puts JSON.pretty_generate(card)
  end

  def card_destroy_action
    print "What is the ID the card you want to remove: "
    input_id = gets.chomp
    response = Unirest.delete("http://localhost:3000/cards/#{input_id}")

    json_data = response.body
    puts json_data["message"]
  end
end