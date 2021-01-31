# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.destroy_all

10.times do
  Genre.create(name: Faker::Book.genre)
end

Book.create(genre: Genre.first, title: 'I àm weirdly accéntèd', sinopsys: 'I like piñatas')

Genre.all.find_each do |genre|
  10.times do
    book = Book.create(title: Faker::Book.title, sinopsys: Faker::Books::Lovecraft.paragraphs(number: 2).join('. '), genre: genre)
    5.times do
      Chapter.create(title: Faker::Marketing.buzzwords, book: book)
    end
  end
end
