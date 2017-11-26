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
      @params[:rateable_id] = item.id
      @params[:rateable_type] = item.class.to_s
      rating = Rating.new(@params)
      if rating.valid?
        Rating.where({
          rateable_id: item.id,
          rateable_type: item.class.to_s,
          user_id: @params[:user_id]
          }).delete_all
        item.ratings << rating
      end
      redirect_back(fallback_location: item)
    end
end
