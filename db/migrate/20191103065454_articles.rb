class Articles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :author
      t.text :url
      t.timestamps
     end
  end
end
