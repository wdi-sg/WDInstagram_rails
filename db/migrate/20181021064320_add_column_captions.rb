class AddColumnCaptions < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :caption, :string
  end
end
