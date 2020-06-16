# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Post.destroy_all

  Post.create([{
    author_name: "Teo",
    photo_url: "https://images.unsplash.com/photo-1556197176-a238f685fd49?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    title: "Water Splashing",
    caption: "DRIPPITY DRIP"
  },
  {
    author_name: "Chang",
    photo_url: "https://images.unsplash.com/photo-1556194718-61e9ab571c2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1649&q=80",
    title: "I LIKE STUFF",
    caption: "CHIOBUUUUUUU"
  },

  {
    author_name: "Hao",
    photo_url: "https://images.unsplash.com/photo-1556173815-d10a0d6be932?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80",
    title: "Train",
    caption: "CHOO CHOO MUTHAFARKA"
  },

  {
    author_name: "Edmund",
    photo_url: "https://images.unsplash.com/photo-1556186207-8fd9d00bbdb3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80",
    title: "Big Black KuKuBird",
    caption: "ITS A BLACK BIRD MAN"
  },

  ])

  p "SEEDED DATA"