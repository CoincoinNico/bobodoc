class AddColumnDrugstoreIdToDrugstoreComments < ActiveRecord::Migration
  def change
    add_column :drugstore_comments, :drugstore_id, :integer
  end
end
