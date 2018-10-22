class RemovePhotoUrlFromEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :photo_url, :string
  end
end
