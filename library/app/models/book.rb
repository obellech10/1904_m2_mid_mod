class Book < ApplicationRecord
  validates_presence_of :title, :pages, :year

  has_many :author_books
  has_many :authors, through: :author_books 
end
