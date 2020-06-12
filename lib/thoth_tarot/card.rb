class ThothTarot::Card

  attr_accessor :name, :link, :instinct, :purpose, :light, :shadow, :qualities

  @@all = []


  def initialize(name, link, instinct = nil, purpose = nil, light = nil, shadow = nil, qualities = nil)
    @name = name
    @link = link
    @instinct = instinct
    @purpose = purpose
    @light = light
    @shadow = shadow
    @qualities = qualities
    save
  end

  #Is this even used>>???
  #def self.create_from_collection(card_array)
  #  binding.pry
  #  card_array.each do |card_hash|
  #    Card.new(card_hash)
  #  end
  #end

  def add_card_attributes(attributes)
    attributes.each do |attr, value|
      self.send("#{attr}", value)
    end
    self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
