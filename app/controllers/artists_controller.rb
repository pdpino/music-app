class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  before_action :set_all_entities, only: [:new, :create, :edit, :update]
  before_action :set_artist_attributes, only: [:show, :edit, :update]

  def index
    # REFACTOR: this is copied in all the controllers with search
    unless params["text"].nil?
      param = "%#{params["text"]}%"
      @artists = Artist.where("name ILIKE ? OR members ILIKE ?", param, param)
      @searched = true
    else
      @artists = Array.new
      @searched = false
    end
  end

  def show
    @artist_songs = @artist.songs
    @artist_albums = @artist.albums

    @artist_comments = @artist.comments
    @artist_rating = @artist.avg_rating
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
    create_params = artist_params
    create_params[:owner_id] = current_user.id

    @artist = Artist.new(create_params)

    if @artist.save
      redirect_to @artist
    else
      render :new
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to @artist
    else
      render :edit
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private
    def artist_params
      # NOTE: do not permit :owner_id, an user would be able to fake the artist creator
      permitted = params.require(:artist).permit(:name, :description, :country, :members, :active_since, :active_until, :image)

      # OPTIMIZE or at least REFACTOR
      params[:all_genres] ||= Array.new
      selected_genres_id = params[:all_genres].map do |x| x.to_i end
      permitted[:genres] = Genre.find(selected_genres_id)

      permitted
    end

    def set_artist
      @artist = Artist.find(params[:id])
    end

    def set_all_entities
      @all_genres = Genre.all
    end

    def set_artist_attributes
      @artist_genres = Array.new @artist.genres
    end

    def set_user
      @user = User.find(@artist.owner_id)
      @has_modify_permission = has_modify_permission?(@user)
    end

    def correct_user
      # Assume this was called already: (but uncomment if necessary)
      # set_artist
      # set_user
      redirect_to root_path unless @has_modify_permission
    end

end
