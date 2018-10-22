class Instagrams < ActiveRecord::Migration[5.2]
  def change
  	create_table :instagrams do |t|
	  t.string :author
	  t.text :photo_url
	  t.string :date_taken
	  t.timestamps
	end
  end
end
