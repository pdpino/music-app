class FollowsController < ApplicationController
  before_action :require_user
  before_action :correct_user

  def follow
    Follow.create({
      follower_id: current_user.id,
      followed_id: params[:followed_id]
      })
    redirect_to :back
  end

  def unfollow
    Follow.where(
      follower_id: current_user.id,
      followed_id: params[:followed_id]
      ).destroy_all
    redirect_to :back
  end

  private
    def correct_user
      redirect_to :back unless has_modify_permission?(User.find(params[:follower_id]))
    end

end
