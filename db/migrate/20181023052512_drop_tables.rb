class DropTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :tables
  end
end
