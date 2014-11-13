class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.string :user_id
      t.text :message

      t.timestamps
    end
  end
end
