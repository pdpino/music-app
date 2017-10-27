class CreateWallMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :wall_messages do |t|
      t.references :writer, references: :users
      t.references :receiver, references: :users

      t.text :message

      t.timestamps
    end
  end
end
