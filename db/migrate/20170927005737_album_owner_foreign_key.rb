class AlbumOwnerForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :albums, :users, column: :owner_id
  end
end
