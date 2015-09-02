require 'mechanize'


class LastfmScraper < Scraper
  LOGIN = {url:"https://secure.last.fm/login",action:"/login"}



  def artists
    artist_page = @agent.get("http://www.last.fm/home/artists")
    artist_blocks = @agent.page.at("div.col-main").search("a.link-block-target")
  
    artists = artist_blocks.map do |b|
      artist =b.text.strip
      link= "#{@agent.page.uri.scheme}://#{@agent.page.uri.host}#{b.attr('href')}"
      {artist: artist, url: link}
    end
  end

  def albums
    albums_page = @agent.get("http://www.last.fm/home/albums")
    album_blocks = @agent.page.at("div.col-main").search("li.recs-feed-item--album")
    
    albums = album_blocks.map do |b|
      album = b.at("a.link-block-target").text.strip
      artist = b.at("p.recs-feed-description").at("a").text.strip
      image_url = b.search("img.layout-image-image")[1].attributes["src"].value
      link = "#{@agent.page.uri.scheme}://#{@agent.page.uri.host}#{b.at("a.link-block-target").attr('href')}"
      {artist: artist, album: album,  url: link, image_url: image_url }
    
    end
  end
  
end
