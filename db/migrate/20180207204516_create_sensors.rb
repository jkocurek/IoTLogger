class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
      t.string :name
      t.integer :temp
      t.string :status

      t.timestamps
    end
  end
end
