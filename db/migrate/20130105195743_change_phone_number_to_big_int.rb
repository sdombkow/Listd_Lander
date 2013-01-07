class ChangePhoneNumberToBigInt < ActiveRecord::Migration
  def change
  	change_column :bars, :phone_number, :integer, :limit => 8
  end
end
