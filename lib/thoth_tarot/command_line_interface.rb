class CommandLineInterface 
  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"
  
  
  def run 
    make_cards
    add_cards_attributes
    display_cards
  end
  
  def make_cards
    card_array = CardScraper.scrape_index_page(BASE_PATH + 'index.html')
    CardScraper.create_from_collection(card_array)
  end
  
  def add_cards_attributes
    Card.all.each do |c|
      attributes = CardScraper.scrape_profile_page(BASE_PATH + c.profile_url)
      c.add_cards_attributes(attributes)
    end
  end
  
  def display_cards
    Card.all.each do |c|
      puts "#{c.name.upcase}".colorize(:purple)
      puts " Instinct:".colorize(:light_blue) + " #{c.instinct}"
      puts " Purpose:".colorize(:light_blue) + " #{c.purpose}"
      puts " The Light".colorize(:light_blue) + " #{c.the_light}"
      puts " The Shadow".colorize(:light_blue) + " #{c.the_shadow}"
      puts " Qualities".colorize(:light_blue) + " #{c.qualities}"
      puts "*******************".colorize(:red)
    end
  end
  
  
end
