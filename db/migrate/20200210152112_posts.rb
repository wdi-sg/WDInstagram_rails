class Posts < ActiveRecord::Migration[5.2]
    def change
        create_table :posts do |t|
        t.string :title
        t.text :photo_url
        t.string :author
        t.timestamps
        end
    end
end
