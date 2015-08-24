class AddLocationToMusicFiles < ActiveRecord::Migration
  def change
    add_column :music_files, :location, :string
  end
end
