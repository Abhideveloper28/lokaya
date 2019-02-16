# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

10.times do
  Author.create(
    name: Faker::Book.author
  )

  Category.create(
    name: Faker::Book.genre
  )
end

100.times do
  Book.create(
    title: Faker::Book.title,
    description: Faker::Books::Dune.quote,
    author_id: rand(Author.first.id..Author.last.id),
    category_id: rand(Category.first.id..Category.last.id)
  )

  BookDetail.create(
    subject: Faker::Book.genre,
    language: [:Hindi, :English].sample.to_s,
    publisher: Faker::Book.publisher,
    edition: rand(1990..2019).to_s,
    pages: rand(45..500),
    copies: rand(10..50),
    book_id: rand(Book.first.id..Book.last.id)
  )
end

30.times do
  Student.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    class_name: rand(1..12),
    section: ('A'..'Z').to_a[rand(6)],
    enrollment_no: ('STD' + '2019' + '-' + rand(1..12).to_s + '-' + rand(1111.9999).to_s),
    contact_no: Faker::PhoneNumber.phone_number_with_country_code,
    email_id: Faker::Internet.email,
    dob: Faker::Date.birthday(5, 18)
  )
end
