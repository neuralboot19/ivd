class CreateBeneficiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :beneficiaries do |t|
      t.string :email
      t.string :full_name
      t.string :birthday
      t.string :signature
      t.string :first_name
      t.string :last_name
      t.string :cel_phone
      t.string :address
      t.string :status_documents
      t.string :family_unit
      t.string :terms_conditions

      t.timestamps
    end
  end
end
