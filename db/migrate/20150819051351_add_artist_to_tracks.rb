class AddArtistToTracks < ActiveRecord::Migration
  def change
    add_reference :tracks, :artist, index: true, foreign_key: true
  end
end
