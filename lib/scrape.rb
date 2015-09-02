scraper = LastfmScraper.new
scraper.login
artists=scraper.artists
artists.each do |a|
  puts a
  artist = Artist.find_or_create_by(title:a[:artist])
  artist.lastfm_url=a[:url]
  recommendation=artist.recommendations.find_or_create_by(source:"last_fm")
  artist.save
end

albums=scraper.albums

albums.each do |a|
  puts a
  artist = Artist.find_or_create_by(title:a[:artist])
  artist.recommendations.find_or_create_by(source:"last_fm")
  album = artist.albums.find_or_create_by(title:a[:album])
  album.lastfm_url=a[:url]
  album.cover_from_url = a[:image_url]
  album.recommendations.find_or_create_by(source:"last_fm")
  album.save
end