class Post < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  validates :author_name, presence: true
  validates :photo_url, presence: true
  validates :title, presence: true
end