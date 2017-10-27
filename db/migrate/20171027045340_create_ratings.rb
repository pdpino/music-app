class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :user
      t.integer :rateable_id
      t.string  :rateable_type

      t.integer :stars

      t.timestamps
    end
  end
end
