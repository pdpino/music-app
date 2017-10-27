class CommentsController < ApplicationController
  before_action :require_user

  def comment_song
    set_song
    params = comment_params
    params[:user_id] = current_user.id

    comment = Comment.new(params)

    @song.comments << comment

    redirect_to song_path(@song)
  end

  private
    def set_song
      @song = Song.find(params[:song_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

end
