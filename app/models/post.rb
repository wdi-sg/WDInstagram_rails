class Post < ApplicationRecord
  validates :author_name, presence: true
  validates :photo_url, presence: true
  validates :title, presence: true
end