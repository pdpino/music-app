class CreatePlaylists < ActiveRecord::Migration[5.0]
  def change
    create_table :playlists do |t|
      t.string :name
      t.string :description
      t.integer :owner_id
      t.integer :ranking

      t.timestamps
    end
  end
end
