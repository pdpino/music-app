module FavoritesHelper
  def can_add_favorite_song(user, song)
    can_add_favorite(current_user, :favorite_songs, song)
  end

  def can_remove_favorite_song(user, song)
    can_remove_favorite(current_user, :favorite_songs, song)
  end

  def can_add_favorite_artist(user, artist)
    can_add_favorite(current_user, :favorite_artists, artist)
  end

  def can_remove_favorite_artist(user, artist)
    can_remove_favorite(current_user, :favorite_artists, artist)
  end

  def can_add_favorite_album(user, album)
    can_add_favorite(current_user, :favorite_albums, album)
  end

  def can_remove_favorite_album(user, album)
    can_remove_favorite(current_user, :favorite_albums, album)
  end

  def can_add_favorite(user, user_items, item)
    user && !is_in?(user.send(user_items), item)
  end

  def can_remove_favorite(user, user_items, item)
    user && is_in?(user.send(user_items), item)
  end
end
