class Entry < ActiveRecord::Base
  has_many :comments
  # AR classes are singular and capitalized by convention
end