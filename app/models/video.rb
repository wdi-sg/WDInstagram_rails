class Video < ApplicationRecord
    validates :author_name, presence: true
    validates :video_url, presence: true
    validates :title, presence: true
end
