class CreateChatMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_messages do |t|
      t.string :username
      t.text :body

      t.timestamps
    end
  end
end
