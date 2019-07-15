# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hemingway = Author.create!(name: "Ernest Hemingway")
king = Author.create!(name: "Stephen King")

arms = hemingway.books.create!(title: "A Farewell to Arms", pages: 332, year: 1929)
stand = king.books.create!(title: "The Stand", pages: 823, year: 1978)
made = king.books.create!(title: "Made Up", pages: 543, year: 1970)

AuthorBook.create!(author: hemingway, book: made)
