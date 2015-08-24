class CreateMusicFiles < ActiveRecord::Migration
  def change
    create_table :music_files do |t|
      t.string :path
      t.string :status
      t.references :track
      
      t.timestamps null: false
    end
  end
end
