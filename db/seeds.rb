# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'ffaker'

(1..10).times do |i|
  Photo.create(
    author: FFaker::Name.name,
    photo_url: FFaker::Image.url,
    caption: FFaker::Lorem.paragraph,
    date_taken: FFaker::Time.date
  )

  rand(1..10).times do
    Comment.create(
      text: FFaker::Lorem.sentence,
      photo_id: i
    )
  end
end
