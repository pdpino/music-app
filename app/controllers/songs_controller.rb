class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  before_action :set_all_entities, only: [:new, :create, :edit, :update]
  before_action :set_song_attributes, only: [:show, :edit, :update]

  def index
    @songs = Song.all
  end

  def show
    @song_comments = @song.comments
    @song_ratings = @song.ratings
  end

  def new
    @song = Song.new

    if params[:album_id] # An album wants to create this
      album = Album.find(params[:album_id])
      @song_artists = Array.new album.artists
      @song_albums = [ album ]
      @eligible_albums << album
    end
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

      params[:eligible_albums] ||= Array.new
      selected_albums_id = params[:eligible_albums].map do |x| x.to_i end
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

      # HACK: don't use raw SQL !!!
      query = "SELECT albums.*
            FROM albums, artists, album_artists as AA, songs, artist_songs as SA
            WHERE albums.id = AA.album_id AND
              artists.id = AA.artist_id AND
              artists.id = SA.artist_id AND
              songs.id = SA.song_id"

      if @song
        query + " AND song.id = #{@song.id}"
      end

      @eligible_albums = Album.find_by_sql(query)
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
