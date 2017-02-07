class CreateShippers < ActiveRecord::Migration[5.0]
  def change
    create_table :shippers do |t|

      t.timestamps
    end
  end
end
