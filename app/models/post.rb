class Post < ApplicationRecord
    has_many :comments
    has_and_belongs_to_many :tags
    belongs_to :user
    
    accepts_nested_attributes_for :comments, :tags
end
