class MessagesController < ApplicationController
  before_action :set_squatter
  before_action :set_message, only: [:update, :show]

  def inbox
    @messages = current_squatter.received_messages
  end

  def sent_items
    @messages = current_squatter.sent_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      flash[:notice] = "Message has been sent"
      redirect_to inbox_squatter_messages_path(current_squatter)
    else
      flash[:alert] = "Unable to send message"
      render :new
    end
  end

  def reply
    @replied_to = Message.find(params[:id])
    @message = Message.new
  end

  private
    def message_params
      params.require(:message).permit(:recipient_id, :sender_id, :title,
				      :body, :replied_to_id, :read, :visible)
    end

    def set_message
      @message = Message.find(params[:id])
    end

    def set_squatter
      @squatter = Squatter.find(params[:squatter_id])
    end
end
