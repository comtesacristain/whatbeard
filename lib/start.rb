require 'mechanize'
require 'find'
require 'id3tag'
# agent = Mechanize.new

# agent.get("http://www.last.fm/login")
# agent.page.forms
# form = agent.page.form_with(:action=>'/login')
#
# form.field_with(:name=>"username").value=''
#
# form.field_with(:name=>"password").value=''
# form.submit
#
# agent.get("http://www.last.fm/home/recs")
#
# puts agent.page.links_with(:class=>"name").map {|m| m.text}
#
# ###
def search_backup
  backup_path = '/Volumes/media/music/backup/'
  mp3s = Find.find(backup_path).select {|m| /.*\.mp3$/ =~ m }.compact
  mp3s.each do |mp3|
    puts mp3
    unless mp3.nil?
      track = Track.find_or_create_by(filepath:mp3) #this should be unique
  
      begin
        tag = ID3Tag.read(File.open(mp3,'rb'))
        album_artist = Artist.find_or_create_by(title:album_artist(tag))
        album = album_artist.albums.find_or_create_by(title:tag.album)
        track.album = album
        track.title = tag.title
        track.artist=Artist.find_or_create_by(title:tag.artist)
        track.file_status ="GOOD"
      rescue Errno::ENOENT => e
        track.file_status ="ERR"
      ensure
        track.save
      end
    end
  end
end

def album_artist(tag)
  if :TP2.in? tag.frame_ids
    return tag.get_frame(:TP2).content
  elsif :TPE2.in? tag.frame_ids
    return tag.get_frame(:TPE2).content
  else 
    return tag.artist
  end
end

search_backup
