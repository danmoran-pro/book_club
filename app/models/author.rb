class Author < ApplicationRecord
  validates_presence_of :name
  has_many :authors_books
  has_many :books, through: :authors_books

  def average_page_count
    books.average(:pages)
  end
end
