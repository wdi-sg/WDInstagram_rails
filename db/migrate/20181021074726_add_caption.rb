class AddCaption < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :caption, :string
  end
end
