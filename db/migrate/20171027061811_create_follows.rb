class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.references :follower, references: :users
      t.references :followed, references: :users

      t.timestamps
    end
  end
end
