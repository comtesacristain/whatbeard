class Artist < ActiveRecord::Base
  has_many :albums
  has_many :album_tracks, :through => :albums, :source => :tracks
  has_many :tracks
  
  has_many :recommendations, as: :recommended
end
