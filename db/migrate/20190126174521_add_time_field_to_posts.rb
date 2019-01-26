class AddTimeFieldToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :timestamps, :string
  end
end
