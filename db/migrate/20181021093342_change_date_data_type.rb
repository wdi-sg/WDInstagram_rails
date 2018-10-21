class ChangeDateDataType < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :date, :datetime
  end
end
