class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  before_action :set_all_entities, only: [:new, :create, :edit, :update]
  before_action :set_song_attributes, only: [:show, :edit, :update]

  def index
    @has_create_permission = current_user || false
    # NOTE: This could be a before_action but is only used here

    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new

    # REVIEW: neccesary ??
    # in _form this things are used,
    @song_artists = Array.new # Empty array
    @song_genres = Array.new
    @song_albums = Array.new
  end

  def edit
  end

  def create
    create_params = song_params
    create_params[:owner_id] = current_user.id

    @song = Song.new(create_params)

    if @song.save
      redirect_to @song
    else
      render :new
    end
  end

  def update
    if @song.update(song_params)
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private
    def song_params
      permitted = params.require(:song).permit(:name, :duration)

      # OPTIMIZE
      params[:all_artists] ||= Array.new
      selected_artists_id = params[:all_artists].map do |x| x.to_i end
      permitted[:artists] = Artist.find(selected_artists_id)

      params[:all_genres] ||= Array.new
      selected_genres_id = params[:all_genres].map do |x| x.to_i end
      permitted[:genres] = Genre.find(selected_genres_id)

      params[:all_albums] ||= Array.new
      selected_albums_id = params[:all_albums].map do |x| x.to_i end
      permitted[:albums] = Album.find(selected_albums_id)

      permitted
      # NOTE: do not permit :owner_id, an user would be able to fake the song creator
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def set_all_entities
      # NOTE: parse to array to be able to match intersection with @song_artists
      @all_artists = Array.new Artist.all
      @all_genres = Array.new Genre.all
      @all_albums = Array.new Album.all # TODO: Find albums where there is an artist
    end

    def set_song_attributes
      @song_artists = Array.new @song.artists
      @song_genres = Array.new @song.genres
      @song_albums = Array.new @song.albums
    end

    def set_user
      @user = User.find(@song.owner_id)
      @has_modify_permission = has_modify_permission?(@user)
    end

    def correct_user
      # Assume this was called already, discomment if necessary
      # set_song
      # set_user
      redirect_to root_path unless @has_modify_permission
    end
end
