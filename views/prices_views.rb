module PricesViews 
  def price_show_view(price)
    puts
    puts "=" * 50
    puts "The card is in #{price["condition"]} condition"
    puts "And its rarity is '#{price["style"]}'"
    puts "Total Worth: #{price["value"]}"
  end

  def prices_index_view(prices)
    if prices != []
      # p 'prices is running'
      prices.each do |price|
        price_show_view(price)
      end
    else
      puts
      puts "There are no prices listed yet" 
    end
  end

  def price_average_view(average, entries)
    puts 
    puts "With #{entries} total prices added,"
    puts "the average price of this card is: $#{average}"     
  end
end