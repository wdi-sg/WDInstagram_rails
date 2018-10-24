class TagsWdinstagrams < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_wdinstagrams do |t|
    t.references :wdinstagram
    t.references :tag
    t.timestamps
    end
  end
end
