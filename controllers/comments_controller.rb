module CommentsController
  def comments_index_action
    response = Unirest.get("http://localhost:3000/comments")
    comments = response.body

    comments_index_view(comments)
    
  end

  def comment_create_action
    client_params = {}
    print "Enter the ID of the card to comment on: "
    input_id = gets.chomp 
    client_params[:commentable_id] = input_id

    puts "Comment: "
    client_params[:text] = gets.chomp

    response = Unirest.post(
                            "http://localhost:3000/comments",
                            parameters: client_params
                            )
    comment = response.body

    comment_show_view(comment)
  end

  def comments_show_action(card_id)
      response = Unirest.get("http://localhost:3000/comments/#{card_id}")
      comments = response.body
      # p comments
      comments_index_view(comments)
  end
end