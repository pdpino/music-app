class FavoritesController < ApplicationController
  before_action :require_user
  before_action :correct_user

  def mark_song
    mark_favorite(Song, @user.favorite_songs, :song_id)
  end

  def mark_artist
    mark_favorite(Artist, @user.favorite_artists, :artist_id)
  end

  def mark_album
    mark_favorite(Album, @user.favorite_albums, :album_id)
  end

  def remove_song
    remove_favorite(Song, @user.favorite_songs, :song_id)
  end

  def remove_artist
    remove_favorite(Artist, @user.favorite_artists, :artist_id)
  end

  def remove_album
    remove_favorite(Album, @user.favorite_albums, :album_id)
  end


  private
    def correct_user
      set_user
      redirect_to root_path unless @has_modify_permission
    end

    def set_user
      @user = User.find(params[:user_id])
      @has_modify_permission = has_modify_permission?(@user)
    end

    def mark_favorite(resource_model, user_resources, resource_id)
      # resource_model: Song, Artist, etc
      # user_resources: @user.favorite_songs, etc
      # resource_id: :song_id, :artist_id, etc
      resource = resource_model.find(params[resource_id])
      if !is_in?(user_resources, resource)
        user_resources << resource
      end

      # TODO: message to the user if can't add favorite
      redirect_to user_path(@user)
    end

    def remove_favorite(resource_model, user_resources, resource_id)
      user_resources.delete(resource_model.find(params[resource_id]))
      # TODO: message to the user if doesn't exist (so is not deleted)
      # delete() it doesn't fail anyway
      redirect_to user_path(@user)
    end

end
