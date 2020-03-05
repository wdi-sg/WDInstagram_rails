class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      	t.string :title
  		t.text :author_name
  		t.text :video_url
  		t.text :caption
      t.timestamps
    end
  end
end
