class AddAlbumToRecommendation < ActiveRecord::Migration
  def change
    add_reference :recommendations, :album, index: true, foreign_key: true
  end
end
