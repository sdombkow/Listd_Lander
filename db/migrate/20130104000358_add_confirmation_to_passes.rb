class AddConfirmationToPasses < ActiveRecord::Migration
  def change
    add_column :passes, :confirmation, :string
	add_index :passes, :confirmation
  end
end
