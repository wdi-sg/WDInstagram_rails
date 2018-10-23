class TagsRename < ActiveRecord::Migration[5.2]
  def change
    rename_column :tags, :Tags, :name
  end
end
