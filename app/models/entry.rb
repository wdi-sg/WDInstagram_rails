class Entry < ActiveRecord::Base
	# AR classes are singular and capitalized by convention
	has_many :comment
	has_and_belongs_to_many :hashtags
end