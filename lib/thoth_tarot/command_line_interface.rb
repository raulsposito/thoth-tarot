class ThothTarot::CommandLineInterface

  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"

  def run
    welcome
    make_cards
    display_cards_list
    start
    binding.pry
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
    input = gets.strip.downcase

    card = ThothTarot::Card.find_by_name(input)
    binding.pry
    ThothTarot::Scraper.scrape_card_profile(card)
    binding.pry
    print_card(card)
  end

  #def validate_input(input)
  #  ThothTarot::Card.all.each do |x|
  #    if x.name.downcase == input
  #      print_card
  #    else
  #      invalid_entry
  #    end
  #  end
  #end

  def invalid_entry
    random = rand(0..5)
    if random == 1
      puts "Ups! Please type a valid card name."
    elsif random == 2
      puts "Please enter the card's name as shown."
    elsif random == 3
      puts "Sorry! Can you please type again?"
    elsif random == 4
      puts "Ooops! Seems like something went wrong. Type one more time."
    else puts "Say what? Say what???"
    end
    #start
  end

  def make_cards
    ThothTarot::Scraper.scrape_index_page(BASE_PATH)
  end

  def print_card(card)
      binding.pry
      puts "*******************".colorize(:red)
      puts "#{self.name}".upcase.colorize(:blue)
      puts " Your card is: #{self.name}".colorize(:light_blue) + " #{self.profile}"
      puts "*******************".colorize(:red)
  end


  #def add_cards_attributes
  #  ThothTarot::Card.all.each do |card|
  #    attributes = ThothTarot::Scraper.scrape_card_profile(card)
  #    #card.add_card_attributes(attributes)
  #  end
  #end


  def display_cards_list
    ThothTarot::Card.all.each do |c|
      puts "*******************".colorize(:red)
      puts "#{c.name.upcase}".colorize(:blue)
      puts "*******************".colorize(:red)
    end
  end

end
