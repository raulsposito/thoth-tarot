require relative '../lib/card.rb'
require relative '../lib/card_scraper.rb'

require "nokogiri"
require "colorize"

class CommandLineInterface 
  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"
  
  
  def run 
    make_cards
    add_cards_attributes
    display_cards
  end
  
  def make_cards
  
  end
  
end
