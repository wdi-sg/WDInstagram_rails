class Posts < ActiveRecord::Migration[5.2]
  def change
  	create_table :posts do |t|
  	  t.string :author_name
  	  t.string :photo_url
  	  t.string :title
  	end
  end
end
