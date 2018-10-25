class RemoveHashtagFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :hashtag, :text
  end
end
