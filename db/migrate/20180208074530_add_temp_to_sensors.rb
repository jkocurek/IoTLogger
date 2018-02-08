class AddTempToSensors < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :temp, :integer
  end
end
