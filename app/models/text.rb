class Text < ApplicationRecord
    validates :author_name, presence: true
    validates :text, presence: true
end
