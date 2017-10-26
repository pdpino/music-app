class ArtistOwnerCascadeForeignKey < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :artists, :users
    add_foreign_key :artists, :users, column: :owner_id, on_delete: :cascade
  end
end
