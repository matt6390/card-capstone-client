class Card
  attr_accessor :id, :name, :description, :element, :race, :rarity
  def initialize(input_options)
    @id = input_options["id"]
    @name = input_options["name"]
    @description = input_options["description"]
    @element = input_options["element"]
    @race = input_options["race"]
    @rarity = input_options["rarity"]
  end





  def self.convert_hashs(card_hashs)
    collection = [ ]

    card_hashs.each do |card_hash|
      collection << Card.new(card_hash)
    end 
    collection
  end
end