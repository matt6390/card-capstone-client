require 'unirest'

require_relative 'controllers/cards_controller'
require_relative 'views/cards_views'
require_relative 'models/card'

class Frontend
  while true
    

    system 'clear'

    puts "Press [1] to show all cards"
    puts "Press [2] to show a specific card"
    puts "Press [3] to create a new card"
    puts "Press [4] to update a card"
    puts "Press [5] to update a card"
    puts
    puts "Enter [signup] to create a new user account"
    puts "Enter [login] to login to your account"
    puts "Enter [logout] to logout of your account"
    puts
    puts "Press [q] to quit"
    user_choice = gets.chomp


    if user_choice == "1"
      response = Unirest.get("http://localhost:3000/cards")
      cards = response.body

      puts JSON.pretty_generate(cards)

    elsif user_choice == "2"
      print "Enter the ID of the card to see: "
      input_id = gets.chomp

      response = Unirest.get("http://localhost:3000/cards/#{input_id}")
      card = response.body
      puts JSON.pretty_generate(card)

        
    elsif user_choice == "3"
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

    elsif user_choice == "4"
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

    elsif user_choice == "5"
      print "What is the ID the card you want to remove: "
      input_id = gets.chomp
      response = Unirest.delete("http://localhost:3000/cards/#{input_id}")

      json_data = response.body
      puts json_data["message"]

    elsif user_choice == "signup"
      puts "Signup!"
      puts
      client_params = {}

      print "Name: "
      client_params[:name] = gets.chomp
      
      print "Email: "
      client_params[:email] = gets.chomp
      
      print "Password: "
      client_params[:password] = gets.chomp
      
      print "Password confirmation: "
      client_params[:password_confirmation] = gets.chomp
      
      response = Unirest.post("http://localhost:3000/users", parameters: client_params)
      puts JSON.pretty_generate(response.body)

    elsif user_choice == "login"
      puts "Login"
      puts 
      print "Email: "
      input_email = gets.chomp

      print "Password: "
      input_password = gets.chomp

      response = Unirest.post(
                              "http://localhost:3000/user_token",
                              parameters: { 
                                            auth: {
                                                    email: input_email,
                                                    password: input_password
                                                    }
                                            }
                              )
      jwt = response.body["jwt"]
      Unirest.default_header("Authorization", "Bearer #{jwt}")

    elsif user_choice == "logout"
      jwt = ""
      Unirest.clear_default_headers


    elsif user_choice == "q"
      puts "Thank you for using my Card App!!!"
      exit
    end

  end
end


# i'll use this for when im too lazy to actually lype out the URLs. We'll see if i transfer over. Just in case though.
private
    def get_request(url, client_params={})
      Unirest.get("http://localhost:3000#{url}", parameters: client_params).body
    end

    def post_request(url, client_params={})
      Unirest.post("http://localhost:3000#{url}", parameters: client_params).body
    end

    def patch_request(url, client_params={})
      Unirest.patch("http://localhost:3000#{url}", parameters: client_params).body
    end

    def delete_request(url, client_params={})
      Unirest.delete("http://localhost:3000#{url}", parameters: client_params).body
    end
end

