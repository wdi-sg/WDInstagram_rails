class Comments < ActiveRecord::Migration[5.2]
  def change
  create_table :comments do |t|
  t.string :comment
  t.references :wdinstagram
  t.timestamps
   end
  end
end
