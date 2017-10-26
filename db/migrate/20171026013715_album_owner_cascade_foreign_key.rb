class AlbumOwnerCascadeForeignKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :albums, :users
    add_foreign_key :albums, :users, column: :owner_id, on_delete: :cascade
  end
end
