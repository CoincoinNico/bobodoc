class AddColumnHighestToMedicament < ActiveRecord::Migration
  def change
    add_column :medicaments, :highest, :float
  end
end
