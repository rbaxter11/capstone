class CreateMeetups < ActiveRecord::Migration[6.0]
  def change
    create_table :meetups do |t|
      t.string :location_name
      t.string :datetime
      t.integer :game_id
      t.integer :host_id
      t.integer :participant_id

      t.timestamps
    end
  end
end
