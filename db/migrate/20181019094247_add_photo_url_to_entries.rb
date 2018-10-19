class AddPhotoUrlToEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :photo_url, :string
  end
end
