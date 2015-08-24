class RemoveFilepathAndFileStatusFromTracks < ActiveRecord::Migration
  def change
    remove_column :tracks, :filepath
    remove_column :tracks, :file_status
  end
end
