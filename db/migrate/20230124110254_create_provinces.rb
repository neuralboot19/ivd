class CreateProvinces < ActiveRecord::Migration[7.0]
  def change
    create_table :provinces do |t|
      t.string :code
      t.string :postal_code
      t.string :name
      t.string :phone_code
      t.string :iso_2

      t.timestamps
    end
  end
end
