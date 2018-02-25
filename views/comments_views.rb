module CommentsViews
  def comment_show_view(comment)
    p comment
    puts "=" * 50
    puts
    puts "Comment:"
    puts "-" * 50
    puts "#{comment["text"]}"
  end

  def comments_index_view(comments)
    comments.each do |comment|
     puts "=" * 50
     puts "Your [#{comment["id"]}] comment"
     puts "Card ID: #{comment["commentable_id"]}"
     puts "#{comment["text"]}"
     puts
    end
  end
end