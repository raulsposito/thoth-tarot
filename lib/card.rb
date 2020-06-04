class Card 
  
  attr_accessor :name, :instict, :purpose, :light, :shadow, :qualities
  
  @@all = []
  
  def initialize(card_hash)
    card_hash.each do |attribute , value|
      self.send("#{attribute}=", value)
    end
    save
  end
  
  def self.create_from_collection(card_array)
    card_array.each do |card_hash|
      Card.new(card_hash)
    end
  end
  
  def add_card_attributes(attributes_hash)
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
    self
  end
  
  def save
    @@all << self
  end
  
  def self.all
    @all 
  end
end