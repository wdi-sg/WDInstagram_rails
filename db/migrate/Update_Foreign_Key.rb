class UpdateForeignKeyAddOnDeleteConstraint < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :posts, :comments
    add_foreign_key :posts, :comments, on_delete: :cascade
  end
end