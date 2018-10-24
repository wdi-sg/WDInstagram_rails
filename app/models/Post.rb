class Post < ActiveRecord::Base
  # AR classes are singular and capitalized by convention
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags
  belongs_to :user, optional: true

end