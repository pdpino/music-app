class NewsController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :delete]
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :set_has_permission, only: [:show, :index]

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

  # def add_song_news
  #   add_news(@song)
  # end
  #
  # def remove_song_news
  #   remove_news(@song)
  # end
  #
  # def add_artist_news
  #   add_news(@artist)
  # end
  #
  # def remove_artist_news
  #   remove_news(@artist)
  # end
  #
  # def add_album_news
  #   add_news(@album)
  # end
  #
  # def remove_album_news
  #   remove_news(@album)
  # end

  private
    def news_params
      @params = params.require(:news).permit(:title, :content, :image)
    end

    def set_news
      @news = News.find(params[:id])
    end

    def set_has_permission
      @has_permission = is_current_user_admin?
    end
end
