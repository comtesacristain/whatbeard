class AddFileStatusToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :file_status, :string
  end
end
