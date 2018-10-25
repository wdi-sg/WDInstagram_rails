class Photo < ActiveRecord::Base
  has_many :comments
  has_and_belongs_to_many :hashtags
  belongs_to :user
end