class Post < ActiveRecord::Base
   # AR classes are singular and capitalized by convention
   belongs_to :user
   has_many :comments
   has_and_belongs_to_many :tags
end