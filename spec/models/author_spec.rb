require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it { should have_many :authors_books }
    it { should have_many(:books).through(:authors_books) }
  end

  describe 'instance methods' do
    it "#average_page_count" do 
      suzanne = Author.create!(name: "Suzanne Collins")

      book_1 = suzanne.books.create!(title: 'The Hunger Games', pages: 374, publication_year: '2008')

      book_2 = suzanne.books.create!(title: 'Catching Fire', pages: 391, publication_year: '2008')

      expect(suzanne.average_page_count).to eq(382.5)
    end
  end
end
