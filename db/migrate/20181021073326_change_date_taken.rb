class ChangeDateTaken < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :date_taken
    add_timestamps :entries
  end
end
