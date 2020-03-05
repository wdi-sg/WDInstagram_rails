class Videos < ActiveRecord::Migration[5.2]
    def change
        create_table :videos do |t|
        t.text :author_name
        t.string :video_url
        t.text :title
        t.text :caption
        t.timestamps
        end
    end


end
