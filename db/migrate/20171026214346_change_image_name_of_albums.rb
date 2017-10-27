class ChangeImageNameOfAlbums < ActiveRecord::Migration[5.0]
  def change
    rename_column :albums, :artwork_img_name, :image
    # Do this to have more common names of images between models
    # image is also called in artist
  end
end
