class CreateBeneficiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :beneficiaries do |t|
      t.string :names
      t.string :email
      t.string :first_surname
      t.string :second_surname
      t.integer :cel_phone, null: false, default: 0
      t.datetime :born
      t.string :other_address
      t.datetime :expiration_date_document
      t.boolean :status_document, default: false
      t.integer :family_unit, null: false, default: 1
      t.boolean :terms_conditions, default: false

      t.timestamps
    end
  end
end
