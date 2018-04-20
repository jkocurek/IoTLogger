class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :sensor_id
      t.integer :high
      t.integer :low
      t.integer :value

      t.timestamps
    end
  end
end
