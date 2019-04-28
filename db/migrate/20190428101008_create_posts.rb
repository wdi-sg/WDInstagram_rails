# frozen_string_literal: true

class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :user_name
      t.text :password
      t.text :cookie

      t.timestamps
    end

    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.text :photo_url
      t.text :title
      t.string :caption

      t.timestamps
    end
  end
end
