class Hashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :hashtags do |t|
      t.string :text
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
