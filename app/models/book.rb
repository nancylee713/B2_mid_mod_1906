class Book < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :total_pages
  validates_presence_of :publication_year

  has_many :author_books
  has_many :authors, through: :author_books
end
