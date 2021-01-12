class AddsAddressToMeetups < ActiveRecord::Migration[6.0]
  def change
    add_column :meetups, :address, :string
  end
end
