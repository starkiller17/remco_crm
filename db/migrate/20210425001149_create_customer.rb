class CreateCustomer < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.belongs_to :category, foreign_key: true
      t.belongs_to :classification, foreign_key: true
      t.string :customer
      t.string :level
      t.string :type
      t.string :web_address
      t.string :created_by
      t.string :updated_by
      t.string :status, default: "ACTIVO"
      t.timestamps
    end
  end
end
