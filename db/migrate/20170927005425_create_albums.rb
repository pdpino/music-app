class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :description
      t.date :release_date
      t.boolean :is_single
      t.string :artwork_img_name

      t.references :owner, references: :users

      t.timestamps
    end
  end
end
