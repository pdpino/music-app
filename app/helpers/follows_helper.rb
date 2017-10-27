module FollowsHelper
  def can_follow(user)
    can_operate(user) && !search_followed(user)
  end

  def can_unfollow(user)
    can_operate(user) && search_followed(user)
  end

  def can_operate(user)
    current_user && current_user.id != user.id
  end

  def search_followed(followed)
    current_user.following.index { |follows| follows.followed_id == followed.id }
  end
end
