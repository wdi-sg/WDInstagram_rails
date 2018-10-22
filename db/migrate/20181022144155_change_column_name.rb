class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :entries, :title, :author
    rename_column :entries, :text, :photo_url
  end
end
