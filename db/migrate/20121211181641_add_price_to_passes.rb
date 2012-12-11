class AddPriceToPasses < ActiveRecord::Migration
  def change
    add_column :passes, :price, :integer

  end
end
