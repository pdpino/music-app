class AlbumsController < ApplicationController
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  before_action :set_all_entities, only: [:new, :create, :edit, :update]
  before_action :set_album_attributes, only: [:show, :edit, :update]

  def index
    @albums = Album.all
  end

  def show
  end

  def new
    @album = Album.new

    if params[:artist_id] # An artist wants to create this
      @album_artists = [Artist.find(params[:artist_id])]
    end
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
      permitted = params.require(:album).permit(:name, :description, :release_date, :is_single, :image)

      # OPTIMIZE
      params[:all_artists] ||= Array.new
      selected_artists_id = params[:all_artists].map do |x| x.to_i end
      permitted[:artists] = Artist.find(selected_artists_id)

      permitted
    end

    def set_album
      @album = Album.find(params[:id])
    end

    def set_all_entities
      @all_artists = Array.new Artist.all
    end

    def set_album_attributes
      @album_artists = Array.new @album.artists
      @album_songs = Array.new @album.songs
    end

    def set_user
      @user = User.find(@album.owner_id)
      @has_modify_permission = has_modify_permission?(@user)
    end

    def correct_user
      redirect_to root_path unless @has_modify_permission
    end

end
