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

Genre.all.find_each do |genre|
  10.times do
    book = Book.create(title: Faker::Book.title, sinopsys: Faker::Books::Lovecraft.paragraphs(number: 2), genre: genre)
    50.times do
      Chapter.create(title: Faker::Marketing.buzzwords)
    end
  end
end
