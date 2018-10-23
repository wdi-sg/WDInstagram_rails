class Instagram < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  has_many :comments
end