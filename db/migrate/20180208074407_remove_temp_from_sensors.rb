class RemoveTempFromSensors < ActiveRecord::Migration[5.1]
  def change
    remove_column :sensors, :temp, :integer
  end
end
