class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.integer :amount,         null: false
      t.datetime :expiration,    null: false
      t.boolean :accepted,       default: false

      t.belongs_to :user,        foreign_key: true
      t.timestamps
    end
  end
end
