class Tag < ActiveRecord::Base
    # AR classes are singular and capitalized by convention
    has_and_belongs_to_many :photos;
  end