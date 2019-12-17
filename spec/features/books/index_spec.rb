require 'rails_helper'


RSpec.describe 'Show Books', type: :feature do
  before :each do
    @suzanne = Author.create!(name: "Suzanne Collins")

    @book_1 = @suzanne.books.create!(title: 'The Hunger Games', pages: 374, publication_year: '2008')

    @book_2 = @suzanne.books.create!(title: 'Catching Fire', pages: 391, publication_year: '2008')
    end

    it 'see a list of books ' do

    visit '/books'

    within("#book-#{@book_1.id}") do
      expect(page).to have_content(@book_1.title)
      expect(page).to have_content("Page count:#{@book_1.pages}")
      expect(page).to have_content("Publication year: #{@book_1.publication_year}")
      expect(page).to have_content("Author name: #{@suzanne.name}")
    end

    within("#book-#{@book_2.id}") do
      expect(page).to have_content(@book_2.title)
      expect(page).to have_content("Page count:#{@book_2.pages}")
      expect(page).to have_content("Publication year: #{@book_2.publication_year}")
      expect(page).to have_content("Author name: #{@suzanne.name}")
    end
  end
end 



# As a user,
# When I visit '/books'
# Then I see each book in the system including the book's:
#   - title
#   - number of pages
#   - publication year
#   - the name of each author that wrote the book
