class ThothTarot::Card

  attr_accessor :name, :link, :profile

  @@all = []


  def initialize(name, link, profile = nil)
    @name = name
    @link = link
    @profile = profile
    save
  end

  #Is this even used>>???
  #def self.create_from_collection(card_array)
  #  binding.pry
  #  card_array.each do |card_hash|
  #    Card.new(card_hash)
  #  end
  #end

  #def add_card_attributes(attributes)
  #  attributes.each do |attr, value|
  #    self.send("#{attr}", value)
  #  end
  #  self
  #end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
end
