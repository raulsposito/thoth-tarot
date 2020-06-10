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

#here i should go thru the attributes and make a hash to then handle
  def self.scrape_card_profile(card_profile)
    cards = {}
    profile_url = Nokogiri::HTML(open(card_profile))
    attr = profile_url.css('.tablepress tr').each do |tr|
      tr.each do |a|
        if a.include?("instinct")
          card[:instinct] = instinct
        elsif a.include?("purpose")
          card[:purpose] = purpose
        elsif a.include?("light")
          card[:light] = light
        elsif a.include?("shadow")
          card[:shadow] = shadow
        elsif a.include?("qualities")
          card[:qualities] = qualities
        end
        #here I can add other content scraped outside the table.
      end
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
