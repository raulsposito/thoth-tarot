class ThothTarot::CardScraper
  
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    card = []
    doc.css('.tablepress td').each do |td|
      if td.text != ""
        if td.css ('img').attribute('alt')
          puts td.css('img').attribute('alt').value
        else puts td.css('a').attribute('href').value
      end
    end
  end
  
  def self.scrape_card_profile(card_profile)
    #code 
  end
  
end