class CreateArtistGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :artist_genres do |t|
      t.belongs_to :artist, index: true
      t.belongs_to :genre, index: true

      t.timestamps
    end
  end
end
