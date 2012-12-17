class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.integer :phone_number
      t.string :address
      t.text :intro_paragraph
	  t.references :user
	
      t.timestamps
    end
	add_index :bars, :user_id
  end
end
