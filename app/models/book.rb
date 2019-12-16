class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :authors_books

  validates_presence_of :title,
                        :pages,
                        :publication
end
