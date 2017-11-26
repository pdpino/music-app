class AddUrlToSong < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :youtube_url, :string
  end
end
