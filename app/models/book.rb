# app/models/book.rb
class Book < ApplicationRecord
    has_many :notes
  end
