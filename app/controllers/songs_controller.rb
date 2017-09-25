class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
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
      params.require(:song).permit(:name, :duration)
      # NOTE: do not permit :owner_id, an user would be able to fake the song creator
    end

    def set_song
      @song = Song.find(params[:id])
    end

    def set_user
      @user = User.find(@song.owner_id)
      @has_permission = has_modify_permission?(@user)
    end

    def correct_user
      # Assume this was called already, discomment if necessary
      # set_song
      # set_user
      redirect_to root_path unless @has_permission
    end
end
