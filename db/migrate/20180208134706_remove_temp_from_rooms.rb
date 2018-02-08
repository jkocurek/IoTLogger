class RemoveTempFromRooms < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :temp, :integer
  end
end
