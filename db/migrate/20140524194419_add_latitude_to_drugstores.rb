class AddLatitudeToDrugstores < ActiveRecord::Migration
  def change
    add_column :drugstores, :latitude, :float
  end
end
