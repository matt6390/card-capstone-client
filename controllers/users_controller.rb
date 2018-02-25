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

  def user_update_action
      client_params = {}
      response = Unirest.get("http://localhost:3000/users/1")
      user = response.body
      input_id = user["id"]
      p user

      print "Name (#{user["name"]}): "
      client_params[:name] = gets.chomp

      print "Email (#{user["email"]}): "
      client_params[:email] = gets.chomp
      
      print "Password (#{user["password"]}): "
      client_params[:password] = gets.chomp
      
      print "Password confirmation (#{user["password_confirmation"]}): "
      client_params[:password_confirmation] = gets.chomp

      client_params.delete_if { |key, value| value.empty?}

      update_response = Unirest.patch(
                                        "http//localhost:3000/users/#{input_id}",
                                        parameters: client_params
                                        )
      user = update_response.body
  end
end






