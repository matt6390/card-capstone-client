module CardsController

    def cards_index_action
        response = get_request("/cards")
        cards = response.body

        cards_index_view(cards)
    end


    def cards_show_action
        print "Enter the ID of the card to see: "
        input_id = gets.chomp

        if input_id != ""
            response = Unirest.get("http://localhost:3000/cards/#{input_id}")
            card = response.body
            card_show_view(card)

            print "Press 'c' to show the comments on this card, 'p' to see its prices, or press 'enter' to continue: "
            com_choice = gets.chomp

            if com_choice == 'c'
                comments_show_action(input_id)
            elsif com_choice == 'p'
                prices_index_action(input_id)
            end
        end
    end

    def card_create_action
        puts "Enter the following information to create a new card"

        client_params = {}

        print "Name: "
        client_params[:name] = gets.chomp

        if client_params[:name] != ""

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

            user_card_create_action(card)
        end
    end

    def card_update_action(input_id)
        client_params = {}

        response = Unirest.get("http://localhost:3000/cards/#{input_id}")
        card_json = response.body


        print "Name (#{card_json["name"]}): "
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

        card_show_view(card)
    end

    def card_destroy_action
        print "What is the ID the card you want to remove: "
        input_id = gets.chomp
        response = Unirest.delete("http://localhost:3000/cards/#{input_id}")

        json_data = response.body
        puts json_data["message"]
    end

    def cards_search_action
        print "Enter the name to search for: "
        search_term = gets.chomp

        if search_term != ""
            card_hashs = get_request("/cards/?search=#{search_term}")
            cards = Card.convert_hashs(card_hashs)
            
            cards_search_view(cards)
        else
            puts "Sorry, but there were no results for that."
        end
    end

    def cards_sort_action(sort)
        card_hashs = get_request("/cards?sort=#{sort}")
        cards = Card.convert_hashs(card_hashs)

        cards_search_view(cards)
    end
end
    

    # def cards_community_action
    #     respone = Unirest.get("http://localhost:3000/cards")
    #     cards = response.body
        
    #     cards_community_view(cards)
    # end