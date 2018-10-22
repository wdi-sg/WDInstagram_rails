class Entry < ActiveRecord::Base
  has_many :comment
  accepts_nested_attributes_for :comment
end
