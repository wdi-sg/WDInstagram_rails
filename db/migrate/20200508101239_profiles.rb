class Profiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :author_name
      t.string :photo_url
      t.string :title
      t.timestamps
    end
  end
end