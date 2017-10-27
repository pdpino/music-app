module CommentsHelper
  def can_remove_comment(comment)
    has_modify_permission?(comment.user)
  end
end
