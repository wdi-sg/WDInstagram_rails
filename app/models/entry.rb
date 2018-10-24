class Entry < ActiveRecord::Base
	# AR classes are singular and capitalized by convention
	has_many :comments, dependent: :destroy
	has_and_belongs_to_many :hashtags
	belongs_to :user
end