# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
end
