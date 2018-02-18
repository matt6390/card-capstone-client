require 'unirest'

system 'clear'

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