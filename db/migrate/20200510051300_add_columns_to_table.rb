class AddColumnsToTable < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :caption, :text
  end
end