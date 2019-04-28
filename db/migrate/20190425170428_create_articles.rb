class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :author_name
      t.string :photo_url
      t.text :title

      t.timestamps
    end
  end
end
