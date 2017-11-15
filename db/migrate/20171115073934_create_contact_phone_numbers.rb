class CreateContactPhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_phone_numbers do |t|
      t.references :contact, foreign_key: true
      t.string :phone_type
      t.integer :phone_number, limit: 8

      t.timestamps
    end
  end
end
