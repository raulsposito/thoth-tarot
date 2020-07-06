class ThothTarot::CommandLineInterface

  BASE_PATH = "https://tarotx.net/tarot-card-meanings/thoth/"

  def run
    welcome
    make_cards
    display_alphabetically
    sleep 3
    display_card_deck
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
    puts "       'Every man and every woman is a star'           ".colorize(:magenta)
    puts "           ✋ 👁 A.C. Book of Thoth ☥                  ".colorize(:magenta)
    puts "                                                       "
    puts "                       ⛤                              ".colorize(:magenta)
    puts "                                                      "
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:light_blue)
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:blue)
  end

  def make_cards
    ThothTarot::Scraper.scrape_index_page(BASE_PATH)
  end

  def display_alphabetically
    puts ""
    puts "This is the Thoth Tarot Deck displayed in alphabetical order"
    sleep 3
    new_array = []
    ThothTarot::Card.all.each do |card|
      new_array << card.name.upcase
    end
    puts new_array.sort_by { |c| c }
  end

  #def display_alphabetically
  #  puts ""
  #  puts "This is the Thoth Tarot Deck displayed alphabetically"
  #  sleep 3
  #  new_array = []
  #  ThothTarot::Card.all.each do |card|
  #    new_array << card.name
  #  end
  #  puts new_array.sort
  #end


  def display_card_deck
    puts ""
    puts "Cards are divided as follows:"
    puts ""
    sleep 3
    ThothTarot::Card.all.each_with_index do |c, index|
      puts "⚜✦✧".colorize(:red) + "#{index}".colorize(:white) + " " + "#{c.name.upcase}".colorize(:blue) + "✦✧⚜".colorize(:red)
    end
  end

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
    puts "                                                    "
    puts "'We must conquer life by living it to the full.'    ".colorize(:magenta)
    puts "            ✋ 👁 A.C. Book of Thoth ☥               ".colorize(:magenta)
    puts "                      ⚸                              ".colorize(:white)
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:light_blue)
    puts "⚜✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧✦✧⚜".colorize(:blue)
    exit!
  end
end
