class NewsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :delete]
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :set_has_permission, only: [:show, :index]
  before_action :set_all_entities, only: [:new, :create, :edit, :update]
  before_action :set_news_attributes, only: [:edit, :update]

  def index
    # REFACTOR: this is copied in all the controllers with search
    unless params["text"].nil?
      @news = News.where("title ILIKE ?", "%#{params["text"]}%")
    else
      @news = News.all
    end
  end

  def show
  end

  def new
    @news = News.new

    @news_artists = Array.new
    @news_albums = Array.new
    @news_songs = Array.new
  end

  def create
    @news = News.new(news_params)

    if @news.save
      redirect_to @news
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @news.update(news_params)
      redirect_to @news
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to news_index_path
  end

  private
    def news_params
      permitted = params.require(:news).permit(:title, :content, :image)

      # OPTIMIZE
      params[:all_artists] ||= Array.new
      selected_artists_id = params[:all_artists].map do |x| x.to_i end
      permitted[:artists_news] = Artist.find(selected_artists_id)

      params[:all_songs] ||= Array.new
      selected_songs_id = params[:all_songs].map do |x| x.to_i end
      permitted[:songs_news] = Song.find(selected_songs_id)

      params[:eligible_albums] ||= Array.new
      selected_albums_id = params[:eligible_albums].map do |x| x.to_i end
      permitted[:albums_news] = Album.find(selected_albums_id)

      permitted
    end

    def set_news
      @news = News.find(params[:id])
    end

    def set_has_permission
      @has_permission = is_current_user_admin?
    end

    def set_all_entities
      # NOTE: parse to array to be able to match intersection with @song_artists
      @all_artists = Array.new Artist.all
      @all_songs = Array.new Song.all
      @eligible_albums = Array.new Album.all
    end

    def set_news_attributes
      @news_artists = Array.new @news.artists_news
      @news_albums = Array.new @news.albums_news
      @news_songs = Array.new @news.songs_news
    end

end
