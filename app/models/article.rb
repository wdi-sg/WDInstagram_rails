class Article < ApplicationRecord
  # AR classes are singular and capitalized by convention
  has_one_attached :image
end