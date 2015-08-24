require 'mechanize'
agent = Mechanize.new

agent.get("https://secure.last.fm/login")
agent.page.forms
form = agent.page.form_with(:action=>'/login')

form.field_with(:name=>"username").value=''

form.field_with(:name=>"password").value=''
form.submit

def get_artists
  artist_page = agent.get("http://www.last.fm/home/artists")
  artist_blocks = agent.page.at("div.col-main").search("a.link-block-target")
  
  artists = artist_blocks.map do |b|
    artist =b.text.strip
    link= "#{agent.page.uri.scheme}://#{agent.page.uri.host}#{b.attr('href')}"
    {artist: artist, url: link}
  end
end

def get_albums
  albums_page = agent.get("http://www.last.fm/home/albums")
  album_blocks = agent.page.at("div.col-main").search("li.recs-feed-item--album")

  albums = album_blocks.map do |b|
    album = b.at("a.link-block-target").text.strip
    artist = b.at("p.recs-feed-description").at("a").text.strip
    link = "#{agent.page.uri.scheme}://#{agent.page.uri.host}#{b.at("a.link-block-target").attr('href')}"
    {artist: artist, album: album,  url: link}
    
  end
end
##