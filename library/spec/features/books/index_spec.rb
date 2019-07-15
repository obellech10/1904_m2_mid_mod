require 'rails_helper'

RSpec.describe 'The Books Index Page' do
  it 'Displays all books and their details' do
    hemingway = Author.create!(name: "Ernest Hemingway")
    king = Author.create!(name: "Stephen King")

    arms = hemingway.books.create!(title: "A Farewell to Arms", pages: 332, year: 1929)
    stand = king.books.create!(title: "The Stand", pages: 823, year: 1978)
    # arms = Book.create!(title: "A Farewell to Arms", pages: 332, year: 1929)
    # stand = Book.create!(title: "The Stand", pages: 823, year: 1978)
    made = king.books.create!(title: "Made Up", pages: 543, year: 1970)

    # arms.authors << hemingway
    # stand.authors << king

    AuthorBook.create!(author: hemingway, book: made)

    visit books_path

    within("#book-#{arms.id}") do
      expect(page).to have_content(arms.title)
      expect(page).to have_content(arms.pages)
      expect(page).to have_content(arms.year)
      expect(page).to have_content("Ernest Hemingway")
    end

    within("#book-#{stand.id}") do
      expect(page).to have_content(stand.title)
      expect(page).to have_content(stand.pages)
      expect(page).to have_content(stand.year)
      expect(page).to have_content("Stephen King")
    end

    within("#book-#{made.id}") do
      expect(page).to have_content(made.title)
      expect(page).to have_content(made.pages)
      expect(page).to have_content(made.year)
      expect(page).to have_content("Ernest Hemingway")
      expect(page).to have_content("Stephen King")
    end

  end
end
