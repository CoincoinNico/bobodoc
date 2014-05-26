class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :drugstore_id
      t.integer :medicament_id
      t.integer :position
      t.datetime :created_at

      t.timestamps
    end
  end
end
