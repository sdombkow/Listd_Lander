class FixColumnNamesOfPasses < ActiveRecord::Migration
  def self.up
    rename_column :passes, :Pass_Set_id, :pass_set_id
    rename_column :passes, :Purchase_id, :purchase_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
