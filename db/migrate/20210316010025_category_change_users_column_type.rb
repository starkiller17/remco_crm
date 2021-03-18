class CategoryChangeUsersColumnType < ActiveRecord::Migration[6.0]
  def change
    change_column :categories, :created_by, :string
    change_column :categories, :updated_by, :string
  end
end
