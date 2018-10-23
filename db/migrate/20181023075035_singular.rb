class Singular < ActiveRecord::Migration[5.2]
  def change
    rename_column :entries_tags, :entries_id, :entry_id
    rename_column :entries_tags, :tags_id, :tag_id
  end
end
