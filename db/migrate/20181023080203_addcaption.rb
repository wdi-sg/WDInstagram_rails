class Addcaption < ActiveRecord::Migration[5.2]
  def change
    add_column :instagrams, :caption, :string
  end
end
