class CommentsController < ApplicationController
  before_action :require_user
  before_action :correct_user, only: [:remove_comment_song, :remove_comment_artist, :remove_comment_album]
  before_action :comment_params, only: [:comment_song, :comment_artist, :comment_album]
  before_action :set_song, only: [:comment_song, :remove_comment_song]
  before_action :set_artist, only: [:comment_artist, :remove_comment_artist]
  before_action :set_album, only: [:comment_album, :remove_comment_album]

  def comment_song
    comment_item(@song)
  end

  def remove_comment_song
    remove_comment_item(@song)
  end

  def comment_artist
    comment_item(@artist)
  end

  def remove_comment_artist
    remove_comment_item(@artist)
  end

  def comment_album
    comment_item(@album)
  end

  def remove_comment_album
    remove_comment_item(@album)
  end

  private
    def set_song
      @song = Song.find(params[:song_id])
    end

    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_album
      @album = Album.find(params[:album_id])
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

    def comment_item(item)
      comment = Comment.new(@params)
      item.comments << comment
      redirect_to :back
    end

    def remove_comment_item(item)
      item.comments.delete(@comment)
      redirect_to :back # REVIEW: redirect to item?
    end

end
