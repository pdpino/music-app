class GenresController < ApplicationController
  before_action :set_permission
  before_action :set_genre, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    # REFACTOR: this is copied in all the controllers with search
    unless params["text"].nil?
      @genres = Genre.where("name ILIKE ?", "%#{params["text"]}%")
    else
      @genres = Genre.all
    end
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      redirect_to @genre
    else
      render :new
    end
  end

  def update
    if @genre.update(genre_params)
      redirect_to @genre
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  private
    def genre_params
      params.require(:genre).permit(:name)
    end

    def set_permission
      @has_permission = is_current_user_admin?
    end

    def set_genre
      @genre = Genre.find(params[:id])
    end

    def correct_user
      redirect_to root_path unless @has_permission
    end
end
