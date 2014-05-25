class CreateMedicaments < ActiveRecord::Migration
  def change
    create_table :medicaments do |t|
      t.string :name
      t.string :form
      t.string :composition
      t.string :indication
      t.string :dose
      t.string :contraindication
      t.integer :price

      t.timestamps
    end
  end
end
