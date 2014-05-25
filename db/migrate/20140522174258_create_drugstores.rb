class CreateDrugstores < ActiveRecord::Migration
  def change
    create_table :drugstores do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :description
      t.references :Medicament, index: true

      t.timestamps
    end
  end
end
