class SongOwnerForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :songs, :users, column: :owner_id
  end
end
