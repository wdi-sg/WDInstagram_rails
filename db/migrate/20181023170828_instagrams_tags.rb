class InstagramsTags < ActiveRecord::Migration[5.2]
  def change

    create_table :instagrams_tags do |t|
       t.references :instagram
       t.references :tag

     end
  end
end
