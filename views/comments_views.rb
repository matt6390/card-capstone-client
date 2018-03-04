module CommentsViews
  def comment_show_view(comment)
    # p comment
    puts
    puts "=" * 50
    puts "Comment From: #{comment["user"]["name"]}"
    puts "On Card: #{comment["card_id"]}"
    puts "At: #{comment["created_at"]}"
    puts "-" * 50
    puts "#{comment["text"]}"
    puts
  end

  def comments_index_view(comments)
    comments.each do |comment|
      # p comment
      comment_show_view(comment)
     # puts "=" * 50
     # puts "Your [#{comment["id"]}] comment"
     # puts "Card ID: #{comment["commentable_id"]}"
     # puts "#{comment["text"]}"
     # puts
    end
  end
end