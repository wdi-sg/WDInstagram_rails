class ChangeDateToTimestamp < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :date
    add_timestamps :posts
  end
end
