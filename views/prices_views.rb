module PricesViews 
  def price_show_view(price)
    puts "=" * 50
    puts "You think that the card is in #{price["condition"]} condition"
    puts "And its rarity is '#{price["style"]}'"
    puts "Total Worth: #{price["value"]}"
  end
end