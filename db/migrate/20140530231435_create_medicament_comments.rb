class CreateMedicamentComments < ActiveRecord::Migration
  def change
    create_table :medicament_comments do |t|
      t.string :title
      t.string :review
      t.integer :medicament_id
      t.integer :user_id

      t.timestamps
    end
  end
end
