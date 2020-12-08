class ChangeDatetimeToStartTimeInMeetups < ActiveRecord::Migration[6.0]
  def change
    rename_column :meetups, :datetime, :start_time
  end
end
