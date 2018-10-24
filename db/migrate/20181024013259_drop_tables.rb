class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :tags
    drop_table :posts_tags
  end
end
