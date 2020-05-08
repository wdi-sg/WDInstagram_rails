class Videos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.text :video_url
      t.timestamps
    end
  end
end
