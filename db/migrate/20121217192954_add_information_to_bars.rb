class AddInformationToBars < ActiveRecord::Migration
  def change
    add_column :bars, :logo, :string

    add_column :bars, :website_url, :string

    add_column :bars, :facebook_url, :string

    add_column :bars, :twitter_url, :string

    add_column :bars, :open_monday, :boolean

    add_column :bars, :open_tuesday, :boolean

    add_column :bars, :open_wednesday, :boolean

    add_column :bars, :open_thursday, :boolean

    add_column :bars, :open_saturday, :boolean

    add_column :bars, :open_sunday, :boolean

    add_column :bars, :houropen_monday, :time

    add_column :bars, :houropen_tuesday, :time

    add_column :bars, :hourclose_tuesday, :time

    add_column :bars, :hourclose_wednesday, :time

    add_column :bars, :houropen_wednesday, :time

    add_column :bars, :houropen_thursday, :time

    add_column :bars, :hourclose_thursday, :time

    add_column :bars, :houropen_friday, :time

    add_column :bars, :hourclose_friday, :time

    add_column :bars, :houropen_saturday, :time

    add_column :bars, :hourclose_saturday, :time

    add_column :bars, :hourclose, :time

  end
end
