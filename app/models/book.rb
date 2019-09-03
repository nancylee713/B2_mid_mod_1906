class Book < ApplicationRecord
  validates_presence_of :title
  validates :total_pages, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1
  }
  validates :publication_year, numericality: {
    only_integer: true,
    
  }

  has_many :author_books
  has_many :authors, through: :author_books
end
