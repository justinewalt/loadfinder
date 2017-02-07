class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|

      t.string :alias,       null: false, default: ""
      t.string :address_1,   null: false, default: ""
      t.string :address_2
      t.string :address_3
      t.string :province,    null: false, default: ""
      t.string :country,     null: false, default: ""
      t.string :zip,         null: false, default: ""

      t.timestamps
    end
  end
end
