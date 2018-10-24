class Furthers < ActiveRecord::Migration[5.2]
	def change
		remove_column :entries, :date_taken
		add_column :entries, :caption, :string
		add_column :entries, :date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end