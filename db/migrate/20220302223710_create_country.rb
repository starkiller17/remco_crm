class CreateCountry < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
      t.string :continent
      t.string :region
      t.float :surface_area
      t.string :indep_year
      t.bigint :population
      t.string :local_name
      t.string :government_form
      t.string :head_of_state
      t.integer :capital
      t.string :code_2
    end
  end
end
