class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    t.string :author
    t.string :photo_url
    t.date :date
end
  end
end
