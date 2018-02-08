class AddHighToSensors < ActiveRecord::Migration[5.1]
  def change
    add_column :sensors, :high, :integer
  end
end
