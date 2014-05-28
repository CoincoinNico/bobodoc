class AddColumnCheapestToMedicaments < ActiveRecord::Migration
  def change
    add_column :medicaments, :cheapest, :float
  end
end
