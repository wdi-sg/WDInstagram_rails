class Posts < ActiveRecord::Migration[5.2]
  def change
create_table :posts do |t|
  t.string :name
  t.text :url
  t.timestamps
end 
 end
end
