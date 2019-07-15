require 'rails_helper'

RSpec.describe 'The Author Show Page' do
  describe 'When I click on authors name in book index' do
    it "it takes me to the author show page" do
      hemingway = Author.create!(name: "Ernest Hemingway")
      king = Author.create!(name: "Stephen King")

      arms = hemingway.books.create!(title: "A Farewell to Arms", pages: 332, year: 1929)
      stand = king.books.create!(title: "The Stand", pages: 823, year: 1978)
      made = king.books.create!(title: "Made Up", pages: 543, year: 1970)

      AuthorBook.create!(author: hemingway, book: made)

      visit books_path

      within("#book-#{arms.id}") do
        click_link 'Ernest Hemingway'
      end

      # expect(current_path).to eq("/authors/#{hemingway.id}")
      expect(current_path).to eq(author_path(hemingway.id))

      expect(page).to have_content(hemingway.name)
      expect(page).to have_content("A Farewell to Arms")
      expect(page).to have_content("Made Up")
      expect(page).to have_content(437.5)

    end
  end
end
