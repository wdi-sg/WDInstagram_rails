class ChangeDateTakenToDatetimeDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :articles, :date_taken, :datetime
  end
end



# default: -> { 'NOW()' }