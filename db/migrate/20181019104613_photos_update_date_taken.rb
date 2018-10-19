class PhotosUpdateDateTaken < ActiveRecord::Migration[5.2]
  def change
    remove_column :photos, :date_taken
    add_column :photos, :date_taken, :datetime
  end
end
