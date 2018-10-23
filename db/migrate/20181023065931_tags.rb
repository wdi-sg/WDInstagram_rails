class Tags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :entries_tags do |t|
      t.references :entries
      t.references :tags
      t.timestamps
    end
  end
end
