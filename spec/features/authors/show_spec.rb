require 'rails_helper'


RSpec.describe 'Show Books', type: :feature do
  before :each do
    @suzanne = Author.create!(name: "Suzanne Collins")

    @book_1 = @suzanne.books.create!(title: 'The Hunger Games', pages: 374, publication_year: '2008')

    @book_2 = @suzanne.books.create!(title: 'Catching Fire', pages: 391, publication_year: '2008')

    @rowling = Author.create!(name: "J. K. Rowling")

    @book_3 = @rowling.books.create!(title: 'Harry Potter and the Sorcerers Stone', pages: 309, publication_year: '1997')
    end

    describe "link to authors show page" do
       it "where I see authors attributes" do

         visit '/books'

         within "#book-#{@book_1.id}" do
           click_link("#{@suzanne.name}")
         end

         expect(current_path).to eq("/authors/#{@suzanne.id}")
         expect(page).to have_content(@suzanne.name)

         within "#book-#{@book_1.id}" do
           expect(page).to have_content(@book_1.title)
         end

         within "#book-#{@book_2.id}" do
           expect(page).to have_content(@book_2.title)
         end

         expect(page).to have_content("Average Page Count: 382.5")
     end
   end
  end

  #
  # As a user,
  # When I visit the Book Index Page,
  #   Then I see each author's name is a link
  # When I click the link
  #   Then I am taken to an Author Show Page where I see the author with that id including the author's:
  #   - name
  #   - the title of each book they have written
  #   - the average number of pages for all of their books
