class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|

      t.integer :tax_id,                  null: false, default: ""
      t.string :main_contact_first_name,  null: false, default: ""
      t.string :main_contact_last_name,   null: false, default: ""
      t.integer :main_contact_phone,      null: false, default: ""
      t.string :main_contact_email,       null: false, default: ""


      t.timestamps
    end
  end
end
