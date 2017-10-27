module WallMessagesHelper
  def can_remove_wall_message message
    has_modify_permission?(message.writer) || has_modify_permission?(message.receiver)
  end
end
