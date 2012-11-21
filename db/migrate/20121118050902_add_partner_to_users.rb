class AddPartnerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :partner, :boolean, :default => false, :null => false

  def self.down
    remove_column :users, :partner
  end
end