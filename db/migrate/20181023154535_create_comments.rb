class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.references :post, foreign_key: false

      t.timestamps
    end
  end
end
