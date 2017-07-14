class CreateSetlistSongs < ActiveRecord::Migration[5.1]
  def change
    create_table :setlist_songs do |t|
      t.references :setlist, foreign_key: true
      t.references :song, foreign_key: true
      t.integer :position, default: 0
      t.timestamps
    end
  end
end
