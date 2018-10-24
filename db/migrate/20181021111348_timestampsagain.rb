class Timestampsagain < ActiveRecord::Migration[5.2]
	def change
		remove_column :entries, :date
		add_column :entries, :date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
