class ThothTarot::Card 
  
  attr_accessor :name, :instict, :purpose, :light, :shadow, :qualities
  
  @@all = []
  
  def welcome
    puts "Welcome to Thoth Tarot CLI"
  end
  
  def initialize(name, instinct = nil, purpose = nil, light = nil, shadow = nil, qualities = nil)
    @name = name 
    @instict = instict 
    @purpose = purpose 
    @light = light 
    @shadow = shadow 
    @qualities = qualities
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