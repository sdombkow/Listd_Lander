class CreatePotentialCustomers < ActiveRecord::Migration
  def change
    create_table :potential_customers do |t|
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
