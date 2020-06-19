class ThothTarot::Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
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
  end

  def self.scrape_card_profile(card)
    profile_url = Nokogiri::HTML(open("#{card.link}"))
    profile_url.css('.tablepress').each do |tr|
      profile = tr.css('.column-2').text
      card.send("profile=", "#{profile}")
    end
  end
end
end
