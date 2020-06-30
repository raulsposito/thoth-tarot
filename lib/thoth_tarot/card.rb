class ThothTarot::Card

  attr_accessor :name, :link, :profile

  @@all = []

  def initialize(name, link, profile = "There is no information available for this card.")
    @name = name
    @link = link
    @profile = profile
    save
  end

  def save
    @@all << self
  end

  def self.all #class method
    @@all
  end
end

# Refactor cards to be listed out alphabetically
