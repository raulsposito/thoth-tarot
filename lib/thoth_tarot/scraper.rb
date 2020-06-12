class ThothTarot::Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    #binding.pry
    doc.css('.tablepress td').each do |card|
      if card.text != ""
        if card.css('img').attribute('alt')
          name = card.css('img').attribute('alt').value
        else
          name = card.css('a').attribute('href').value.to_s.delete_prefix!("https://tarotx.net/tarot-card-meanings/thoth/").chomp('.html').split('-').join(' ').capitalize
      end
      link = card.css('a').attribute('href').value
      ThothTarot::Card.new(name, link)
    end
    #binding.pry
  end



  def self.scrape_card_profile(card)
    attributes = {}
    profile_url = Nokogiri::HTML(open("#{card.link}"))
    attributes = profile_url.css('.tablepress tr').each do |tr|
      #binding.pry
      instinct = tr.css('.column-2').text
      card.send("instinct=", "#{instinct}")

      binding.pry
      #self[:instinct].send(tr.css('.column-2').text)
      #card[:instinct] = tr.css('.column-2').text
    end
    binding.pry
  end
##This Scraper needs to be refactored
#  def self.scrape_card_profile(card)
#    attributes = {}
#    binding.pry
#    profile_url = Nokogiri::HTML(open("#{card.link}"))
#    attributes = profile_url.css('.tablepress tr').each do |tr|
#      tr.each do |a|
#        if a.include?("instinct")
#          card[:instinct] = instinct.text
#        elsif a.include?("purpose")
#          card[:purpose] = purpose.text
#        elsif a.include?("light")
#          card[:light] = light.text
#        elsif a.include?("shadow")
#          card[:shadow] = shadow.text
#        elsif a.include?("qualities")
#          card[:qualities] = qualities.text
#        end
#        binding.pry
#        #here I can add other content scraped outside the table.
#      end
#    end


end
end
