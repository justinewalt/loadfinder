class CreateShippers < ActiveRecord::Migration[5.0]
  def change
    create_table :shippers do |t|

      t.belongs_to :company,       foreign_key: true
      t.timestamps
    end
  end
end
