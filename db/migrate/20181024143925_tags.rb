class Tags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :hash_tag
      t.timestamps
    end
  end
end