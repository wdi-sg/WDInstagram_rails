class Post < ApplicationRecord
  validates :author_name, :title, presence: true
end
