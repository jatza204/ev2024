class AddForeignKeyForBookToNotes < ActiveRecord::Migration[7.1]
  def change
    # Dodajemy klucz obcy i indeks dla lepszej wydajności.
    add_foreign_key :notes, :books
    add_index :notes, :book_id
  end
end