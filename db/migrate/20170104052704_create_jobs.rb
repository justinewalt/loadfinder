class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :pickup_location,       null: false
      t.string :dropoff_location,      null: false
      t.date :pickup_date,             null: false
      t.date :dropoff_date,            null: false
      t.text :description,             null: false
      t.text :special_notes
      t.boolean :delivered,            default: false

      t.belongs_to :user,              foreign_key: true
      t.timestamps
    end
  end
end
