class CreateCredit < ActiveRecord::Migration[6.0]
  def change
    create_table :credits do |t|
      t.string :credit
      t.string :created_by
      t.string :updated_by
      t.string :status, default: "ACTIVO"
      t.timestamps
    end
  end
end
