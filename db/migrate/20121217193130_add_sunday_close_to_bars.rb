class AddSundayCloseToBars < ActiveRecord::Migration
  def change
    add_column :bars, :hourclose_sunday, :time

  end
end
