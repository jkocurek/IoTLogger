class RemoveStatusFromSensors < ActiveRecord::Migration[5.1]
  def change
    remove_column :sensors, :status, :string
  end
end
