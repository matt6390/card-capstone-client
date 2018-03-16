module YuGiOhController

  def yugioh_name_price_search
    print "What is the name of your card? (Be careful for spelling and punctuation): "
    card_name = gets.chomp
    print "What is the print-tag of your card: "
    print_tag = gets.chomp.upcase
    response = Unirest.get("http://yugiohprices.com/api/get_card_prices/" + card_name)
    cards = response.body["data"]
    # p cards

    cards.each do |card|
      if card['print_tag'] == print_tag
        yugioh_name_price_view(card, card_name)
        puts "-" * 50
      end
    end

  end

  def yugioh_card_details_search
    print "Enter the name of the card you are searching for: "
    card_name = gets.chomp
    response = Unirest.get("http://yugiohprices.com/api/card_data/" + card_name)
    response_status = response.body["status"]
    card = response.body['data']

    if response_status != "fail"
      puts '='* 50
      puts "Name: #{card["name"]}"
      puts '-' * 30
      puts "Description: #{card["text"]}"
      puts "Attribute: #{card["type"]}"
      puts "Element: #{card["family"]}"
      puts
    else
      puts "'#{card_name}' was not found, please check your spelling"
    end
  end
    
end