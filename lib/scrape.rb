scraper = LastfmScraper.new
scraper.login
artists=scraper.artists
artists.each do |a|
  artist = Artist.find_or_create_by(title:a[:artist])
  recommendation=artist.recommendations.find_or_create_by(source:"last_fm")
end

albums=scraper.albums

albums.each do |a|
  artist = Artist.find_or_create_by(title:a[:artist])
  artist.recommendations.find_or_create_by(source:"last_fm")
  album = artist.albums.find_or_create_by(title:a[:album])
  album.recommendations.find_or_create_by(source:"last_fm")
end