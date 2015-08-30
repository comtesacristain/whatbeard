
require 'find'
require 'id3tag'

class LibraryOrganiser
  #paths = "/Volumes/media/music/all/" type :library
  #@path = "/Volumes/media/music/all/2 Many DJ's/"
  
  # @path
  # @type
  def initialize(path=nil, location=nil)
    @path = path
    @location = location
  end

  def search
    if @path.nil? || @location.nil?
      return
    end
    mp3s = Find.find(@path).select {|m| /.*\.(mp3|m4a|flac)$/ =~ m }.compact
    mp3s.each do |mp3|
      track = Track.find_or_create_by(filepath:mp3)
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
          track.location = @location
          track.save
        end
    end
  end

  private
  def album_artist(tag)
    if :TP2.in? tag.frame_ids
      return tag.get_frame(:TP2).content
    elsif :TPE2.in? tag.frame_ids
      return tag.get_frame(:TPE2).content
    else 
      return tag.artist
    end
  end
end

