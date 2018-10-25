class Wdinstagram < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_and_belongs_to_many :tags
  # AR classes are singular and capitalized by convention
  # attr_accessor :date, :time
end