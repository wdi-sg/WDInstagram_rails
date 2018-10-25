require 'ffaker'

# 10.times do |i|
#   Entry.create(
#     author: FFaker::Name.name, #=> "Christophe Bartell"
#     photo_url: FFaker::Image.url,
#     date_taken: FFaker::Time.date
#     )
#
#   (rand * 10).to_i.times do
#     Comment.create(
#       text: FFaker::Lorem.sentence,
#       entry_id: i
#       )
#   end
# end

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(rand * 10).to_i.times do
    Comment.create(
      text: FFaker::Lorem.sentence,
      entry_id: 26
      )
  end
