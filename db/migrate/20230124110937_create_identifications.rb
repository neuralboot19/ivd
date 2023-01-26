class CreateIdentifications < ActiveRecord::Migration[7.0]
  def change
    create_table :identifications do |t|
      t.string :type_identification

      t.timestamps
    end
  end
end
