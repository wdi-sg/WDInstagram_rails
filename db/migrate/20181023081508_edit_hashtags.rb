class EditHashtags < ActiveRecord::Migration[5.2]
  def change
    remove_column :hashtags, :article_id
  end
end
