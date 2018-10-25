class PostsHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags_posts do |t|
      t.references :post
      t.references :hashtag
      t.timestamps
  end
end
end