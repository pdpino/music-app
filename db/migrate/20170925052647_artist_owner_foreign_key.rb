class ArtistOwnerForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :artists, :users, column: :owner_id
  end
end
