class CreateMeetupInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :meetup_invitations do |t|
      t.references :meetup, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :invited_by_id
      t.boolean :accepted, default: false

      t.timestamps
    end
  end
end
