require 'nokogiri'
require 'open-uri'

class CardScraper
  
  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    card = []
    
    doc.css('.tablepress td').each do |td|
      if td.css('img').attribute('alt')
        puts td.css('img').attribute('alt').value
      end
      puts td.css('a').attribute('href').value
    end
    
  end 
  
end