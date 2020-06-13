class ThothTarot::CommandLineInterface

  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"

  def welcome
    puts "************************************".colorize(:blue)
    puts "************************************".colorize(:blue)
    puts "                                    "
    puts "     Welcome to Thoth Tarot CLI     ".colorize(:white)
    puts "                                    "
    puts "               ✯                   ".colorize(:magenta)
    puts "                                    "
    puts "'Every man and every woman is a star'".colorize(:blue)
    puts "        A.C. Book of Thoth          ".colorize(:blue)
    puts "                                    "
    puts "************************************".colorize(:blue)
    puts "************************************".colorize(:blue)
  end

  #def start
  #  puts "What card you wish to know more about?"
  #  input = gets.strip.to_i
  #  print_card(input)
  #end

  def run
    welcome
    make_cards
    #start
    add_cards_attributes
    #binding.pry
    display_cards
  end

  def make_cards
    ThothTarot::Scraper.scrape_index_page(BASE_PATH)
    #binding.pry
  end


  def add_cards_attributes
    ThothTarot::Card.all.each do |card|
      attributes = ThothTarot::Scraper.scrape_card_profile(card)
      #card.add_card_attributes(attributes)
    end
  end


  def display_cards
    ThothTarot::Card.all.each do |c|
      puts "*******************".colorize(:red)
      puts "#{c.name.upcase}".colorize(:purple)
      puts " Profile:".colorize(:light_blue) + " #{c.profile}"
      puts "*******************".colorize(:red)
    end
  end


end
