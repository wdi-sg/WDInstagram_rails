class RemoveAuthorField < ActiveRecord::Migration[5.2]
	def change
		remove_column :entries, :author
		remove_column :comments, :author
  end
end
