class Wdinstagram < ActiveRecord::Base
  has_many :comment
  # AR classes are singular and capitalized by convention
  # attr_accessor :date, :time
end