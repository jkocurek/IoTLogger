class AddHighToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :high, :integer
  end
end
