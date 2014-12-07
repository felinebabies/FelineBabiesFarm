class ChatMessagesController < ApplicationController
  before_filter :authenticate_user!

  def new
  end

  def index
    @chat_messages = get_recent_messages
    @chat_message = ChatMessage.new
  end

  def create
    @chat_messages = get_recent_messages
    @chat_message = ChatMessage.new(chat_message_params)
    @chat_message.user_id = current_user.id
    @chat_message.save
  end
  
  def update
    @chat_messages = get_recent_messages
  end

  private
    def chat_message_params
      params.permit(:message)
    end

    def get_recent_messages
      ChatMessage.order("created_at DESC").limit(10)
    end
end
