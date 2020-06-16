class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :type, :type_of
  end
end