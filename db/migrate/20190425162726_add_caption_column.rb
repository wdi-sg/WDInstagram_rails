class AddCaptionColumn < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :captions, :text
  end
end