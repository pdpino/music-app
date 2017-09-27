class CreateAlbumSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :album_songs do |t|
      t.belongs_to :album, index: true
      t.belongs_to :song, index: true

      t.timestamps
    end
  end
end
