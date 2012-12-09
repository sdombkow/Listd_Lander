class AddEntriesToPasses < ActiveRecord::Migration
  def change
    add_column :passes, :entries, :integer, :default => 0, :null => 0
  end
end
