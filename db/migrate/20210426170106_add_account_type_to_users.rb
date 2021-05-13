class AddAccountTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :account_type, :integer, null: false, default: 0
  end
end
