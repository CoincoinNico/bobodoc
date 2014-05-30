class CreateDrugstoreComments < ActiveRecord::Migration
  def change
    create_table :drugstore_comments do |t|
      t.string :title
      t.string :review

      t.timestamps
    end
  end
end
