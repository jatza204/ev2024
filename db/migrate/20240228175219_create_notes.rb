class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.string :user
      t.integer :book_id
      t.integer :note

      t.timestamps
    end
  end
end
