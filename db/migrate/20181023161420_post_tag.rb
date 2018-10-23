class PostTag < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tag do |t|
      t.references :post_id
      t.references :tag_id
    end
  end
end
