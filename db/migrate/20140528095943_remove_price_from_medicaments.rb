class RemovePriceFromMedicaments < ActiveRecord::Migration
  def change
    remove_column :medicaments, :price, :integer
  end
end
