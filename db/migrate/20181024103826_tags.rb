class Tags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :content
      t.timestamps
    end
  end
end
