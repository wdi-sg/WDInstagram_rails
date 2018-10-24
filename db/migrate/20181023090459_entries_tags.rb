class EntriesTags < ActiveRecord::Migration[5.2]
create_table :entries_tags do |t|
  t.references :entry
  t.references :tag
  t.timestamps
  end
end
