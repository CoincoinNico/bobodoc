class AddUserIdColumnToDrugstoreComments < ActiveRecord::Migration
  def change
    add_column :drugstore_comments, :user_id, :integer
  end
end
