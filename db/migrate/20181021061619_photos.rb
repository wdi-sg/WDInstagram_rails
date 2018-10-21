class Photos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :author
      t.string :url
      t.string :date
    end
  end
end
