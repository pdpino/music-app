class CreateSongGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :song_genres do |t|

      t.timestamps
    end
  end
end
