class ThothTarot::CommandLineInterface

  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"

  def run
    welcome
    make_cards
    display_cards_list
    start
    add_cards_attributes
    #binding.pry
  end

  def welcome
    puts "************************************".colorize(:blue)
    puts "************************************".colorize(:cyan)
    puts "                                    "
    puts "     Welcome to Thoth Tarot CLI     ".colorize(:white)
    puts "                                    "
    puts "               ✯                   ".colorize(:magenta)
    puts "                                    "
    puts "'Every man and every woman is a star'".colorize(:blue)
    puts "        A.C. Book of Thoth          ".colorize(:cyan)
    puts "                                    "
    puts "************************************".colorize(:cyan)
    puts "************************************".colorize(:blue)
  end

  def start
    puts "What card you wish to know more about?"
    input = gets.strip.to_i
    #Here I would validate users input and select specific card to scrape more about.
    #CODE MISSSING
    print_card(input)
  end

  def make_cards
    ThothTarot::Scraper.scrape_index_page(BASE_PATH)
    #binding.pry
  end

  #this is where i left for python class
  #this code does to things and it should only print the card. logic should be elsewhere
  def print_card(input)
    c = ThothTarot::Card.find_by_name(input)
    c.each do |x|
      puts "*******************".colorize(:red)
      puts "#{x.name.upcase}".colorize(:blue)
      puts " Your card is: ".colorize(:light_blue) + " #{x.profile}"
      puts "*******************".colorize(:red)
    end
  end

  def add_cards_attributes
    ThothTarot::Card.all.each do |card|
      attributes = ThothTarot::Scraper.scrape_card_profile(card)
      #card.add_card_attributes(attributes)
    end
  end


  def display_cards_list
    ThothTarot::Card.all.each do |c|
      puts "*******************".colorize(:red)
      puts "#{c.name.upcase}".colorize(:blue)
      puts "*******************".colorize(:red)
    end
  end


end
