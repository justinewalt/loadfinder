class CreateHauliers < ActiveRecord::Migration[5.0]
  def change
    create_table :hauliers do |t|

      t.integer :drivers_license,     null: false
      t.integer :registration,        null: false
      t.integer :truck_license,       null: false
      t.integer :truck_vin,           null: false
      t.integer :rating,              defualt: 0

      t.belongs_to :company,          foreign_key: true
      t.timestamps
    end
  end
end
