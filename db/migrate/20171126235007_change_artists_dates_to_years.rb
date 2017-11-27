class ChangeArtistsDatesToYears < ActiveRecord::Migration[5.0]
  def change
    remove_column :artists, :active_since
    remove_column :artists, :active_until
    add_column :artists, :active_since, :integer
    add_column :artists, :active_until, :integer
  end
end
