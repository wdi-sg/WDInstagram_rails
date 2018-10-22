class Post < ActiveRecord::Base
   # AR classes are singular and capitalized by convention
   has_many :comment
end