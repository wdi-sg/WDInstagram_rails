class AddUserToWdinstagrams < ActiveRecord::Migration[5.2]
  def change
    add_reference :wdinstagrams, :user, foreign_key: true
  end
end
