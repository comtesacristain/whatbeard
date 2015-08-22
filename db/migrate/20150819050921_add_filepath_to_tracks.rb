class AddFilepathToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :filepath, :text
  end
end
