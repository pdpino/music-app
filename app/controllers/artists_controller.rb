class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
  end

  def edit
  end

  def create
    @artist = Artist.new(artist_params)

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
    redirect_to artists_url
  end

  private
    def set_artist
      @artist = Artist.find(params[:id])
    end

    def set_user
      @user = User.find(@artist.user_id)
    end

    def artist_params
      params.require(:artist).permit(:name, :description, :country, :members, :active_since, :active_until)
    end

    def correct_user
      # set_artist # Assume this is already called, discomment if necessary
      set_user
      redirect_to root_path unless current_user?(@user)
    end

end
