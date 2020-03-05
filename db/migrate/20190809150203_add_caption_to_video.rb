class AddCaptionToVideo < ActiveRecord::Migration[5.2]
  def change
    add_column :videos, :caption, :text
  end
end