class AddColumnsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :caption, :string
    add_column :posts, :created_at, :timestamp
    add_column :posts, :updated_at, :timestamp
  end
end
