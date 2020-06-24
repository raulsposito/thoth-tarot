class ThothTarot::CommandLineInterface

  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"

  def run
    welcome
    make_cards
    #initial
    display_cards_list
    start
  end

  def welcome
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:blue)
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:light_blue)
    puts "                       ☿️                               ".colorize(:magenta)
    puts "                                                       "
    puts "    ☽   🔮 Welcome to Thoth Tarot CLI 🔮   ☾          ".colorize(:cyan)
    puts "                                                       "
    puts "              🌛🌖🌗🌑🌓🌔🌕🌜                      ".colorize(:white)
    puts "                                                       "
    puts "         ♈♉♊♋♌♍♎♏♐♑♒♓                ".colorize(:light_blue)
    puts "                                                       "
    puts "       'Every man and every woman is a star'           ".colorize(:cyan)
    puts "           ✋ 👁 A.C. Book of Thoth ☥                  ".colorize(:cyan)
    puts "                                                       "
    puts "                       ⛤                              ".colorize(:magenta)
    puts "                                                      "
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:light_blue)
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:blue)
  end

  def make_cards
    ThothTarot::Scraper.scrape_index_page(BASE_PATH)
  end

  #def initial
  #  puts "Please select the range you wish to view the card's names listing.".colorize(:white)
  #  puts "0-9, 10-19, 20-29 and so on...".colorize(:white)
  #  from_number = gets.strip.to_i
  #  #Needs logic to validate input
  #  display_cards_list(from_number)
  #end

  def start
      puts " There are 78 Cards in Thoth Tarot. ".colorize(:white)
      puts "What card you wish to know more about?".colorize(:white)
      puts "Please type a number between 0 and 77".colorize(:white)
      input = gets.strip.downcase
      while input != "exit"
        card_index = input.to_i
        card = ThothTarot::Card.all[card_index]
        if input.match(/^[a-zA-Z]/)
          invalid_entry
        elsif
          input.to_i.between?(0, 77)
          ThothTarot::Scraper.scrape_card_profile(card)
          print_card(card)
        else
          invalid_entry
        end
        start
      end
      exit
  end

  def display_cards_list
    ThothTarot::Card.all.each_with_index do |c, index|
      puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:red)
      puts "#{index}".colorize(:white) + " " + "#{c.name.upcase}".colorize(:blue)
      puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:red)
      puts ""
      puts ""
    end
  end

  #def display_cards_list(from_number)
  #  puts ""
  #  puts "Cards from #{from_number} to #{from_number+10}"
  #  puts ""
  #  ThothTarot::Card.all[from_number, 10].each_with_index do |c, index|
  #    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:red)
  #    puts "#{index+from_number}".colorize(:white) + " " + "#{c.name.upcase}". colorize(:blue)
  #    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:red)
  #    puts ""
  #    puts ""
  #  end
  #end

  def invalid_entry
    random = rand(0..5)
    if random == 1
      puts "Ups! Please type a valid card.".colorize(:red)
    elsif random == 2
      puts "Please enter the number as shown.".colorize(:red)
    elsif random == 3
      puts "Sorry! Can you please type again?".colorize(:red)
    elsif random == 4
      puts "Ooops! Seems like something went wrong. Type one more time.".colorize(:red)
    else puts "Say what???".colorize(:red)
    end
    start
  end

  def print_card(card)
      puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:red)
      puts "   #{card.name}".upcase.colorize(:blue)
      puts " Your card is: #{card.name}".colorize(:light_blue)
      puts " #{card.profile}".colorize(:white)
      puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:red)
  end

  def exit
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:blue)
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:light_blue)
    puts "                                                   "
    puts "  Thank you for looking into The Book of Thoth!     ".colorize(:white)
    puts "                                                 "
    puts " 'We must conquer life by living it to the full.'     ".colorize(:magenta)
    puts "               Aleister Crowley.                    ".colorize(:magenta)
    puts "                      ⚸                              ".colorize(:white)
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:light_blue)
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:blue)
    exit!
  end
end
