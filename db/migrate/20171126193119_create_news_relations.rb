class CreateNewsRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :news_relations do |t|
      t.references :news
      t.integer :newsable_id
      t.string  :newsable_type

      t.timestamps
    end
  end
end
