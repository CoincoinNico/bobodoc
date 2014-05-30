class ChangeAveragePriceFormatInMedicament < ActiveRecord::Migration
  def change
   change_column :medicaments, :average_price, :float
  end
end
