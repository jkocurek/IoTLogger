class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :temp
      t.string :status

      t.timestamps
    end
  end
end
