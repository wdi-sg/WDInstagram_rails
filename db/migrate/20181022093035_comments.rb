class Comments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
    t.string :usercomment
    t.references :article
    t.timestamps
end
  end
end

