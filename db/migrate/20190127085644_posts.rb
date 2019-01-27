class Posts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |a|
      a.string :author_name
      a.string :photo_url
    end
  end
end