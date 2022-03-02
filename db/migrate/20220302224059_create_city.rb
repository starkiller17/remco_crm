class CreateCity < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :country_code
      t.string :district
      t.bigint :population
    end
  end
end
