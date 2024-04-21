class ChatController < ApplicationController
    before_action :initialize_chat
  
    def index
        redirect_to books_path  # Or wherever it makes sense to redirect
    end
  
    def create
        # Prepend the new message at the beginning of the array to maintain order
        $chat_messages.unshift({
          username: current_user.nick, 
          body: params[:message_body], 
          timestamp: Time.now
        })
      
        # Respond to the request with different formats
        respond_to do |format|
          format.turbo_stream {
            # Update the chat window with the latest 20 messages
            render turbo_stream: turbo_stream.update("chat_window",
                                                     partial: "books/messages",
                                                     locals: { messages: $chat_messages.first(20) })
          }
          format.html { 
            # Provide a fallback path for HTML requests, in case JavaScript is disabled
            redirect_to fallback_path 
          }
        end
      end
      
      
      
  
    private
  
    def initialize_chat
      # Initialize the global variable if it doesn't exist
      $chat_messages ||= []
    end
  end
  
