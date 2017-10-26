class CreateFavorites < ActiveRecord::Migration[5.0]
  def change
    create_table :favorites do |t|
      t.references :user
      t.integer :favoritable_id
      t.string  :favoritable_type

      t.timestamps
    end
  end
end
