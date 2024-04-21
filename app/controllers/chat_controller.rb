class ChatController < ApplicationController
  def index
    redirect_to books_path  # Redirect to books path or any appropriate path
  end
  
  def create
    # Create a new chat message using the model
    ChatMessage.create(username: current_user.nick, body: params[:message_body])
    
    # Fetch the latest 20 messages ordered by creation time
    @messages = ChatMessage.order(created_at: :desc).limit(20)

    # Respond to the request with different formats
    respond_to do |format|
      format.turbo_stream {
        # Update the chat window with the latest 20 messages
        render turbo_stream: turbo_stream.update("chat_window",
                                                 partial: "books/messages",
                                                 locals: { messages: @messages })
      }
      format.html { 
        # Provide a fallback path for HTML requests, in case JavaScript is disabled
        redirect_to fallback_path 
      }
    end
  end
end
