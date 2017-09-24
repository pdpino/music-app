class CreateArtists < ActiveRecord::Migration[5.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.text :description
      t.string :country
      t.string :members
      t.date :active_since
      t.date :active_until

      t.references :user # creator of the artist

      t.timestamps
    end
  end
end
