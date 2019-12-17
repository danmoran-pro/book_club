class Book < ApplicationRecord
  has_many :authors_books
  has_many :authors, through: :authors_books

  validates_presence_of :title,
                        :pages,
                        :publication_year
end
