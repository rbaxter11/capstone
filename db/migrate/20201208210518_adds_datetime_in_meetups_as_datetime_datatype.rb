class AddsDatetimeInMeetupsAsDatetimeDatatype < ActiveRecord::Migration[6.0]
  def change
    add_column :meetups, :datetime, :datetime
  end
end
