class Timestamps < ActiveRecord::Migration[5.2]
	def change
		remove_column :entries, :date
		add_column :entries, :date, :date, default: -> { 'CURRENT_DATE' }
  end
end
