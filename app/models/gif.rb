class Gif < ApplicationRecord

  include HTTParty
  #key "dHUqDU9cWpWLeHOiaWWTJgMmFDOyYh3h"
  base_uri "http://api.giphy.com/v1/gifs"

  def self.random
    get("/random", query: { api_key: "dHUqDU9cWpWLeHOiaWWTJgMmFDOyYh3h" } )
  end

  def self.search_fixed
    get("/search", query: { q: "happy", api_key: "dHUqDU9cWpWLeHOiaWWTJgMmFDOyYh3h", limit: 4 } )
  end
  def self.search term
    get("/search", query: { q: term, api_key: "dHUqDU9cWpWLeHOiaWWTJgMmFDOyYh3h", limit: 4 } )
  end

  def self.ryan
    get("?q=ryan+gosling&api_key=dHUqDU9cWpWLeHOiaWWTJgMmFDOyYh3h&limit=5")
  end


end