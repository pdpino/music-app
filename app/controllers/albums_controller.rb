class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # before_action :set_all_entities, only: [:new, :create, :edit, :update]
  # before_action :set_song_attributes, only: [:show, :edit, :update]

  def index
    @has_create_permission = current_user || false
    # NOTE: This could be a before_action but is only used here

    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new

    # REVIEW: neccesary ??
    # in _form this things are used,
    # @song_artists = Array.new # Empty array
    # @song_genres = Array.new # Empty array
  end

  def edit
  end

  def create
    create_params = album_params
    create_params[:owner_id] = current_user.id

    @album = Album.new(create_params)

    if @album.save
      redirect_to @album
    else
      render :new
    end
  end

  def update
    if @album.update(album_params)
      redirect_to @album
    else
      render :edit
    end
  end

  def destroy
    @album.destroy
    redirect_to albums_path
  end

  private
    def album_params
      permitted = params.require(:album).permit(:name, :description, :release_date, :is_single, :artwork_img_name)

      # OPTIMIZE
      # params[:all_artists] ||= Array.new
      # selected_artists_id = params[:all_artists].map do |x| x.to_i end
      # permitted[:artists] = Artist.find(selected_artists_id)
      #
      # params[:all_genres] ||= Array.new
      # selected_genres_id = params[:all_genres].map do |x| x.to_i end
      # permitted[:genres] = Genre.find(selected_genres_id)

      permitted
      # NOTE: do not permit :owner_id, an user would be able to fake the song creator
    end

    def set_album
      @album = Album.find(params[:id])
    end

    # def set_all_entities
    #   # NOTE: parse to array to be able to match intersection with @song_artists
    #   @all_artists = Array.new Artist.all
    #   @all_genres = Array.new Genre.all
    # end
    #
    # def set_song_attributes
    #   @song_artists = Array.new @song.artists
    #   @song_genres = Array.new @song.genres
    # end

    def set_user
      @user = User.find(@album.owner_id)
      @has_modify_permission = has_modify_permission?(@user)
    end

    def correct_user
      redirect_to root_path unless @has_modify_permission
    end

end
