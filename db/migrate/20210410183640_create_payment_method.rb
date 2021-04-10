class CreatePaymentMethod < ActiveRecord::Migration[6.0]
  def change
    create_table :payment_methods do |t|
      t.string :payment_method
      t.string :created_by
      t.string :updated_by
      t.string :status, default: "ACTIVO"
      t.timestamps
    end
  end
end
