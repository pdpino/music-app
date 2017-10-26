class SongOwnerCascadeForeignKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :songs, :users
    add_foreign_key :songs, :users, column: :owner_id, on_delete: :cascade
  end
end
