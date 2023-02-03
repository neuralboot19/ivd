class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.string :kg, null: false, default: "0.0"

      t.timestamps
    end
  end
end
