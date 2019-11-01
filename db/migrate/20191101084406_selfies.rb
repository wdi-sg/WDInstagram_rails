class Selfies < ActiveRecord::Migration[5.2]
  def change
    create_table :selfies do |t|
    t.string :author_name
    t.string :title
    t.string :url
    t.timestamps
end
  end
end