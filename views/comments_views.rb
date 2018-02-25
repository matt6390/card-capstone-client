module CommentsViews
  def comment_show_view(comment)
    puts
    puts "=" * 50
    puts "Comment From User: #{comment["user_id"]}"
    puts "On Card: #{comment["commentable_id"]}"
    puts "-" * 50
    puts "#{comment["text"]}"
    puts
  end

  def comments_index_view(comments)
    comments.each do |comment|
      comment_show_view(comment)
     # puts "=" * 50
     # puts "Your [#{comment["id"]}] comment"
     # puts "Card ID: #{comment["commentable_id"]}"
     # puts "#{comment["text"]}"
     # puts
    end
  end
end