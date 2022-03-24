class ChangeContacts < ActiveRecord::Migration[6.0]
  def change
    add_index :contacts, [:name, :last_name, :customer_id], unique: true
  end
end
