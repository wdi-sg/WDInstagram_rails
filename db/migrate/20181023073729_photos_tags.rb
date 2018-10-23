class PhotosTags < ActiveRecord::Migration[5.2]
  def change
    create_table :photos_tags do |t|
      t.references :photo
      t.references :tag
    end
  end
end
