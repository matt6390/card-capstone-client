module PricesController
  def prices_index_action(input_id)
    response = Unirest.get("http://localhost:3000/prices?search=#{input_id}")
    prices = response.body
    prices_index_view(prices)
  end

  def price_create_action
    print "Enter the ID of the card to leave a price on: "

    client_params = {}
    input_id = gets.chomp
    client_params[:card_id] = input_id

    response = Unirest.get("http://localhost:3000/cards/#{input_id}")
    card = response.body
    card_show_view(card)

    print "How much do you think the card costs? "
    client_params[:value] = gets.chomp

    print "What condition does the card appear to be in? "
    client_params[:condition] = gets.chomp

    print "What source is your information from? "
    client_params[:source] = gets.chomp

    print "How rare do you believe this card actually is? "
    client_params[:style] = gets.chomp

    response = Unirest.post(
                            "http://localhost:3000/prices",
                            parameters: client_params
                            )
    price = response.body
    price_show_view(price)

  end

  def price_average_action
    print "Enter the ID of the card who's average price you want to see: "
    input_id = gets.chomp

    response = Unirest.get("http://localhost:3000/cards/#{input_id}")
    card = response.body
    # p card
    average = card["average_price"]
    # p average
    
    price_average_view(average)
  end

end







