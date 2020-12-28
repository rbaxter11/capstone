class RemovesParticipantIdFromMeetups < ActiveRecord::Migration[6.0]
  def change
    remove_column :meetups, :participant_id, :integer
  end
end
