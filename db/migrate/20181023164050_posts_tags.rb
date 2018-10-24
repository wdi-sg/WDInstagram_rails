class PostsTags < ActiveRecord::Migration[5.2]
  def change
    create_table :posts_tags do |t|
      t.references :post
      t.references :tag
      t.timestamps
    end
  end
end
