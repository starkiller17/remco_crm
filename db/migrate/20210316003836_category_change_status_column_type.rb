class CategoryChangeStatusColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :status, :string, default: "active"
  end
end
