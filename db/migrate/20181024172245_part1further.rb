class Part1further < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :date_taken
    add_column :posts, :caption, :string
    add_column :posts, :date_taken, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
