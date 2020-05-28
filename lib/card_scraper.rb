require 'open-uri'

class CardScraper
  
  def self.scrape_index_page(index_url)
    index_url = Nokogiri::HTML(open(index_url))
    card = []
    index_page.css("table#tablepress-95.tablepress.tablepress-id-95 tr td center a img").each do |c| 
      card_name = "#{c.attr('alt').text.strip}"
      card << {name: card_name}
    end
  end 
  
end