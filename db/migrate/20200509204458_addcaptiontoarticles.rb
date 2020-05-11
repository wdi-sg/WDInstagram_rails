class Addcaptiontoarticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :caption, :text
  end
end

#run rails g migration addcaptiontoarticles