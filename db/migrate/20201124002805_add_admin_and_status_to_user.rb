class AddAdminAndStatusToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :status, :boolean, default: true
  end
end
