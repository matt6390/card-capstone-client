module DecksViews
  def deck_show_view(deck)
    puts '=' * 50
    puts "Deck Owner: #{deck["user"]["name"]}"
    puts "Deck Id: #{deck["id"]}"
    puts "Deck Name: #{deck["name"]}"
    puts "Info: #{deck["info"]}"
    puts
  end

  def decks_index_view(decks)
    decks.each do |deck|
      deck_show_view(deck)
    end
  end
end