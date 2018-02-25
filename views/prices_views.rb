module PricesViews 
  def price_show_view(price)
    puts
    puts "=" * 50
    puts "The card is in #{price["condition"]} condition"
    puts "And its rarity is '#{price["style"]}'"
    puts "Total Worth: #{price["value"]}"
  end

  def prices_index_view(prices)
    prices.each do |price|
      price_show_view(price)
    end
  end
end