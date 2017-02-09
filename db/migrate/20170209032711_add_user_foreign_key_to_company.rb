class AddUserForeignKeyToCompany < ActiveRecord::Migration[5.0]
  def up
    add_column :companies, :user_id, :integer
    add_foreign_key :companies, :users
  end

  def down

  end
end
