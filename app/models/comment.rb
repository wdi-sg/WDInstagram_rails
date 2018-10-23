class Comment < ActiveRecord::Base
  belongs_to :article

  # validates :usercomment, presence: true, length: { maximum: 80 }
  # validates :article_id, presence: true
end