class Tag < ActiveRecord::Base
  has_and_belongs_to_many :wdinstagrams
  # AR classes are singular and capitalized by convention
  # attr_accessor :date, :time
end