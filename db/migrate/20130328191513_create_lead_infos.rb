class CreateLeadInfos < ActiveRecord::Migration
  def change
    create_table :lead_infos do |t|
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
