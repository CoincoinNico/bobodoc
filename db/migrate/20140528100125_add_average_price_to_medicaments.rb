class AddAveragePriceToMedicaments < ActiveRecord::Migration
  def change
    add_column :medicaments, :average_price, :integer
  end
end
