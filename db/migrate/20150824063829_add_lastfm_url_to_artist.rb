class AddLastfmUrlToArtist < ActiveRecord::Migration
  def change
    add_column :artists, :lastfm_url, :string
  end
end
