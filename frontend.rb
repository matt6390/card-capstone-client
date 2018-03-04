require 'unirest'

require 'rubygems'
require 'twilio-ruby'

require_relative 'controllers/cards_controller'
require_relative 'controllers/comments_controller'
require_relative 'controllers/users_controller'
require_relative 'controllers/prices_controller'
require_relative 'controllers/user_cards_controller'

require_relative 'views/cards_views'
require_relative 'views/comments_views'
require_relative 'views/prices_views'
require_relative 'views/user_cards_views'

require_relative 'models/card'

class Frontend

  include CardsController
  include CommentsController
  include UsersController
  include PricesController
  include UserCardsController
  
  include CardsViews
  include CommentsViews
  include PricesViews
  include UserCardsViews

  def run
    while true
      

      system 'clear'
      puts "Welcome to My Card Capstone"
      puts "=" * 80
      puts

      puts "Enter [signup] to create a new user account"
      puts "Enter [login] to login to your account"
      # puts "      Enter [user] to update user information"
      puts "Enter [logout] to logout of your account"
      puts
      puts "Enter [remove] to remove your account"
      puts "-" * 50
      puts
      puts "Enter [cards] to display your cards"
      puts
      puts "Press [1] to show all cards"
      puts "    Press [1.1] to search by name"
      puts "    Press [1.2] to sort by Element"
      puts "    Press [1.3] to sort by Type"
      puts "Press [2] to show a specific card"
      puts "----Press [2.1] to leave a price on a card"
      puts "------Press [2.11] to see average card cost"
      puts "----Press [2.2] to leave a comment on a card"
      puts "Press [3] to create a new card"
      puts "Press [4] to update a card"
      puts "Press [5] to delete one of your cards"
      puts "-" * 50
      puts
      puts "Enter [comments] to display all comments"
      puts
      puts "Press [q] to quit"
      user_choice = gets.chomp


      if user_choice == "1"
        cards_index_action

      elsif user_choice == "1.1"
        cards_search_action

      elsif user_choice == "1.2"
        cards_sort_action("element")


      elsif user_choice == "1.3"
        cards_sort_action("race")
        

      elsif user_choice == "2"
        cards_show_action

      elsif user_choice == "2.1"
        price_create_action

      elsif user_choice == "2.11"
        price_average_action
          
      elsif user_choice == "2.2"
        comment_create_action
        
      elsif user_choice == "3"
        card_create_action

      elsif user_choice == "4"
        # card_update_action
        user_card_update_action

      elsif user_choice == "5"
        user_card_destroy_action

      elsif user_choice == "cards"
        user_cards_index_action

      elsif user_choice == "comments"
        comments_index_action

      elsif user_choice == "signup"
        user_create_action

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

      # elsif user_choice == "user"
      #     user_update_action

      elsif user_choice == "logout"
        jwt = ""
        Unirest.clear_default_headers

      elsif user_choice == "remove"
        print "What is your user id? "
        user_id = gets.chomp
        response = Unirest.delete("http://localhost:3000/users/#{user_id}")

        p response.body["message"]


      elsif user_choice == "q"
        puts "Thank you for using my Card App!!!"
        jwt = ""
        Unirest.clear_default_headers
        exit
      end
    user_choice = gets.chomp
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
