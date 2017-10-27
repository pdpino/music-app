class RatingsController < ApplicationController
  before_action :require_user
  before_action :rating_params

  def rate_song
    rate_item(Song.find(params[:song_id]))
  end

  private
    def rating_params
      @params = params.require(:rating).permit(:stars)
      @params[:user_id] = current_user.id
    end

    def rate_item(item)
      item.ratings << Rating.new(@params)
      redirect_to :back
    end
end
