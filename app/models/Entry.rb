class Entry < ActiveRecord::Base
  has_many :comments
  accepts_nested_attributes_for :comments
  has_and_belongs_to_many :tags
end
