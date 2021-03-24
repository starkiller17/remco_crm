class CreateClassification < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      t.string :classification
      t.string :created_by
      t.string :updated_by
      t.string :status, default: "ACTIVO"
      t.timestamps
    end
  end
end
