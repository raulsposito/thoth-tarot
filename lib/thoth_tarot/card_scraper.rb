class ThothTarot::CardScraper
  
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    card = []
    doc.css('.tablepress td').each do |card|
      if card.text != ""
        if card.css('img').attribute('alt')
          puts card.css('img').attribute('alt').value 
        else puts card.css('a').attribute('href').value.to_s.delete_prefix!("https://tarotx.net/tarot-card-meanings/thoth/").chomp('.html').split('-').join(' ').capitalize
      end
    end
    card << self
  end
  
  
  def self.scrape_card_profile(card_profile)
    cards = {}
    doc.css('.tablepress td').each do |card|
      name = card.css('img').attribute('alt').value
    end
  end

      
    #code 
    
    #:name, 
    #:instict, 
    #:purpose, 
    #:light, 
    #:shadow, 
    #:qualities
end
end