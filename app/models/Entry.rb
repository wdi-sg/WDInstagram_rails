class Entry < ActiveRecord::Base
  has_many :comments

  has_and_belongs_to_many :tags
  # AR classes are singular and capitalized by convention
end