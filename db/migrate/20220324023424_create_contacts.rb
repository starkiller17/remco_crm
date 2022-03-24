class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.belongs_to :customer, foreign_key: true
      t.string :name
      t.string :last_name
      t.string :job
      t.string :telephone_number
      t.string :cellphone_number
      t.string :email
      t.boolean :marketing
      t.string :created_by
      t.string :updated_by
      t.string :status, default: "ACTIVO"
      t.timestamps
    end
  end
end
