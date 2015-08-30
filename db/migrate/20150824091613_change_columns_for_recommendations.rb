class ChangeColumnsForRecommendations < ActiveRecord::Migration
  def change
    add_reference :recommendations, :recommended, index: true
    add_column :recommendations, :recommended_type, :string
    remove_column :recommendations, :album_id
    remove_column :recommendations, :artist_id
  end
end
