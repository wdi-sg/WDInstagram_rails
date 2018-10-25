class AddHashtagToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :hashtag, :text
  end
end
