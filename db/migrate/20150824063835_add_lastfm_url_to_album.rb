class AddLastfmUrlToAlbum < ActiveRecord::Migration
  def change
    add_column :albums, :lastfm_url, :string
  end
end
