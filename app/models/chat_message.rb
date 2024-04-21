# app/models/chat_message.rb
class ChatMessage < ApplicationRecord
end

# db/migrate/[timestamp]_create_chat_messages.rb
class CreateChatMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_messages do |t|
      t.string :username
      t.text :body
      t.timestamps
    end
  end
end