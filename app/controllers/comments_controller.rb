class CommentsController < ApplicationController
  before_action :require_user
  before_action :correct_user, only: [:remove_comment_song]
  before_action :comment_params, only: [:comment_song]
  before_action :set_song, only: [:comment_song, :remove_comment_song]

  def comment_song
    comment = Comment.new(@params)

    @song.comments << comment

    redirect_to song_path(@song)
  end

  def remove_comment_song
    @song.comments.delete(@comment)

    redirect_to song_path(@song)
  end

  private
    def set_song
      @song = Song.find(params[:song_id])
    end

    def comment_params
      @params = params.require(:comment).permit(:content)
      @params[:user_id] = current_user.id
    end

    def set_comment
      @comment = Comment.find(params[:comment_id])
      @has_modify_permission = has_modify_permission?(@comment.user)
    end

    def correct_user
      set_comment
      redirect_to root_path unless @has_modify_permission
    end

end
