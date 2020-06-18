class ThothTarot::CommandLineInterface

  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"

  def run
    welcome
    make_cards
    display_cards_list
    start
  end

  def menu
    display_cards_list
    start
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

  def make_cards
    ThothTarot::Scraper.scrape_index_page(BASE_PATH)
  end

  def start
    puts "What card you wish to know more about?"
    puts "Please type a number between 0 and 77"
    input = gets.strip.to_i
    card_index = input.to_i
    card = ThothTarot::Card.all[card_index]
    if input != '' || 0
      ThothTarot::Scraper.scrape_card_profile(card)
      print_card(card)
    else
      invalid_entry
    end
    repeat?
  end

  def repeat?
    puts "************************************".colorize(:red)
    puts "Still curious to know more?".colorize(:white)
    puts "Please type Y or N".colorize(:white)
    puts "************************************".colorize(:red)
    input = gets.strip.downcase
    if input == "y"
      menu
    elsif input == "n"
      exit
    else
      invalid_entry
    end
  end

  def exit
    puts "*********************************************".colorize(:red)
    puts "Thank you for looking into The Book of Thoth!".colorize(:blue)
    puts "                                              "
    puts "We must conquer life by living it to the full.".colorize(:magenta)
    puts "Aleister Crowley.".colorize(:magenta)
    puts "*********************************************".colorize(:red)
  end

  def display_cards_list
    ThothTarot::Card.all.each_with_index do |c, index|
      puts "*******************".colorize(:red)
      puts "#{index}." "#{c.name.upcase}".colorize(:blue)
      puts "*******************".colorize(:red)
    end
  end

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
    start
  end

  def print_card(card)
      puts "************************************".colorize(:red)
      puts "#{card.name}".upcase.colorize(:blue)
      puts " Your card is: #{card.name}".colorize(:light_blue)
      puts " #{card.profile}".colorize(:white)
      puts "************************************".colorize(:red)
  end

end
