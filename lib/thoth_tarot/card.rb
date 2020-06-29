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

  def self.all
    @@all
  end
end
