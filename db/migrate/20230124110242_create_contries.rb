class CreateContries < ActiveRecord::Migration[7.0]
  def change
    create_table :contries do |t|
      t.string :name
      t.string :iso

      t.timestamps
    end
  end
end
