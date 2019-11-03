class Post < ApplicationRecord
  has_many :comments
  validates :author_name, :title, presence: true
end
