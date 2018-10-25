class Article < ActiveRecord::Base
  has_many :comments
  has_and_belongs_to_many :hashtags
  accepts_nested_attributes_for :hashtags
  belongs_to :user

end