class AddLongitudeToDrugstores < ActiveRecord::Migration
  def change
    add_column :drugstores, :longitude, :float
  end
end
