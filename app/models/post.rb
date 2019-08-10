class Post < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  validates :title, presence: true,
                    length: { minimum: 5 }
end