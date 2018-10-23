class RemoveDateTakenFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :date_taken
  end
end
