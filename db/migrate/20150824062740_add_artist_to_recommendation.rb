class AddArtistToRecommendation < ActiveRecord::Migration
  def change
    add_reference :recommendations, :artist, index: true, foreign_key: true
  end
end
