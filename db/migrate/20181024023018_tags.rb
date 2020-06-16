class Tags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    create_table :photos_tags do |t|
      t.references :photo
      t.references :tag
    end
  end
end
