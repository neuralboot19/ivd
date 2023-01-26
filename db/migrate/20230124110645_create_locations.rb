class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :code_municipality
      t.string :name_municipality
      t.string :code_ine_municipality
      t.string :code_nuts_4
      t.string :name_nuts_4

      t.timestamps
    end
  end
end
