class Post < ApplicationRecord
  has_many :comments
  validates :description, :title, presence: true,
  length: {minimum: 5}
end
