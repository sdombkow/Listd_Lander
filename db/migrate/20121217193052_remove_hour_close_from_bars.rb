class RemoveHourCloseFromBars < ActiveRecord::Migration
  def up
    remove_column :bars, :hourclose
      end

  def down
    add_column :bars, :hourclose, :time
  end
end
