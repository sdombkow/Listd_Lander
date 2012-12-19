class AddInfoPartDosToBars < ActiveRecord::Migration
  def change
    add_column :bars, :open_friday, :boolean

    add_column :bars, :hourclose_monday, :time

    add_column :bars, :houropen_sunday, :time

  end
end
