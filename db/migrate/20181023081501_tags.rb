class Tags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
    t.string :hashtag
    t.timestamps
  end
  end
end
