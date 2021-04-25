class CreateBillTo < ActiveRecord::Migration[6.0]
  def change
    create_table :bill_tos do |t|
      t.belongs_to :payment_method
      t.belongs_to :customer
      t.belongs_to :credit
      t.string :rfc
      t.string :name
      t.string :email
      t.string :curp
      t.string :account_number
      t.string :currency_code
      t.string :created_by
      t.string :updated_by
      t.string :status, default: "ACTIVO"
      t.timestamps
    end
  end
end
