class WallMessagesController < ApplicationController
  before_action :require_user
  before_action :correct_user, only: [:remove_wall_message]

  def new_wall_message
    message_params
    message = WallMessage.create(@params)
    redirect_to :back
  end

  def remove_wall_message
    @message.destroy
    redirect_to :back
  end

  private
    def message_params
      @params = params.require(:wall_message).permit(:message)
      @params[:writer_id] = current_user.id
      @params[:receiver_id] = params[:receiver_id]
    end

    def correct_user
      @message = WallMessage.find(params[:message_id])
      redirect_to :back unless helpers.can_remove_wall_message(@message)
    end
end
