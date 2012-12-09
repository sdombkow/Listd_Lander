class CreatePasses < ActiveRecord::Migration
  def change
    create_table :passes do |t|
      t.references :Pass_Set
      t.references :Purchase
      t.string :name
      t.boolean :redeemed

      t.timestamps
    end
    add_index :passes, :Pass_Set_id
    add_index :passes, :Purchase_id
  end
end
