class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
		t.string :title
  		t.text :author_name
  		t.text :body
      t.timestamps
    end
  end
end
