class AddCaptionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :caption, :text
  end
end