class AddAddressFieldsToBars < ActiveRecord::Migration
  def change
    add_column :bars, :street_address, :string

    add_column :bars, :city, :string

    add_column :bars, :zip_code, :string

    add_column :bars, :state, :string

  end
end
