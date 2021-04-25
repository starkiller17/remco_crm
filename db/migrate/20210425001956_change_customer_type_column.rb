class ChangeCustomerTypeColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :customers, :type, :customer_type
  end
end
