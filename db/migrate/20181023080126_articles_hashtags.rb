class ArticlesHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :articles_hashtags do |t|
      t.references :article
      t.references :hashtag
      t.timestamps
    end
  end
end
