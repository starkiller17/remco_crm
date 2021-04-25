class CreateAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :customer, foreign_key: true
      t.belongs_to :bill_to, foreign_key: true
      t.text :address
      t.text :street
      t.string :external_num
      t.string :internal_num
      t.text :colony
      t.string :postal_code
      t.string :city
      t.string :state
      t.text :reference
      t.string :industrial_zone
      t.string :address_type, default: "SHIP_TO"
      t.string :created_by
      t.string :updated_by
      t.string :status, default: "ACTIVO"
      t.timestamps
    end
  end
end
