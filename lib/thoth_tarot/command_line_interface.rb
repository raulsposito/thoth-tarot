class ThothTarot::CommandLineInterface

  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"

  def welcome
    puts "Welcome to Thoth Tarot CLI"
  end

  def run
    welcome
    make_cards
    binding.pry
    add_cards_attributes
    binding.pry
    display_cards
  end

  def make_cards
    ThothTarot::Scraper.scrape_index_page(BASE_PATH)
    #binding.pry
  end


  def add_cards_attributes
    ThothTarot::Card.all.each do |card|
      attributes = ThothTarot::Scraper.scrape_card_profile(card.profile_url)
      card.add_card_attributes(attributes)
    end
  end


  def display_cards
    ThothTarot::Card.all.each do |c|
      puts "*******************".colorize(:red)
      puts "#{c.name.upcase}".colorize(:purple)
      #puts " Instinct:".colorize(:light_blue) + " #{c.instinct}"
      #puts " Purpose:".colorize(:light_blue) + " #{c.purpose}"
      #puts " The Light".colorize(:light_blue) + " #{c.the_light}"
      #puts " The Shadow".colorize(:light_blue) + " #{c.the_shadow}"
      #puts " Qualities".colorize(:light_blue) + " #{c.qualities}"
      puts "*******************".colorize(:red)
    end
  end


end
