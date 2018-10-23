class Entry < ApplicationRecord
    has_many :comments
    has_and_belongs_to_many :tags
end
