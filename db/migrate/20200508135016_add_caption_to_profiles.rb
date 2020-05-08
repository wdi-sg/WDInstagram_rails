class AddCaptionToProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :profiles, :caption, :string
  end
end