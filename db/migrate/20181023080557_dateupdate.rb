class Dateupdate < ActiveRecord::Migration[5.2]
  def change
     add_column :instagrams, :date_taken, :datetime
  end
end
