class Timestamp < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :photos, null: false, default: -> { "NOW()" }
  end
end
