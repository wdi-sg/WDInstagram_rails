class Posts < ActiveRecord::Migration[5.2]
  def change
  	create_table :posts do |t|
	  t.string :title
	  t.string :photo_url
	  t.text :caption
	  t.text :author_id
	  t.timestamps
	end
  end
end

