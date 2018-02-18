module UsersController
  def user_create_action
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
  end
end
