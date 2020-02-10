class AddCaptionsToPictures < ActiveRecord::Migration[5.2]
  def change
    add_column :pictures, :captions, :string
  end
end
