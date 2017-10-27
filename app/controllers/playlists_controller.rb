class PlaylistsController < ApplicationController

  def index
    @playlists = Playlist.all
  end
  def show
    @playlist = Playlist.find(params[:id])
  end

  def new
    @playlist = Playlist.new
  end

  def create
    #@article = Article.new(title: params[:article][:title],
      #body: params[:article][:body])
    #con strongparams podemos crear articulos de esta manera:
    @playlist = Playlist.new(playlist_params)
    if @playlist.save
      redirect_to @playlist
    else
      render :new
      #redirect_to :new_playlist
    end
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    @playlist.destroy #(elimina el objeto de la BD)
    redirect_to playlists_path
  end

  #UPDATE article
  #PUT /articles/:id
  def update

  end


  #stong params
  private
  def playlist_params
    params.require(:playlist).permit(:name,:description,:owner_id,:ranking)
  end

end
