class Renametags < ActiveRecord::Migration[5.2]
  def change
    rename_table :tags, :hashtags
  end
end
