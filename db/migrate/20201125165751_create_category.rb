class CreateCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :category
      t.integer :created_by
      t.integer :updated_by
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
