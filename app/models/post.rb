class Post < ApplicationRecord
  has_and_belongs_to_many :hashtags
  has_many :comments
  validates :title, presence: true,
  length: {minimum: 5}
end
