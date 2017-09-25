class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :name
      t.time :duration # REVIEW: other type?

      t.references :owner, references: :users # owner of the song

      t.timestamps
    end
  end
end
