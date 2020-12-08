class RemoveDatetimeInMeetups < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetups, :datetime, :string
  end
end
