class MeetupInvitation < ApplicationRecord
  belongs_to :meetup
  belongs_to :user
  belongs_to :invited_by, class_name: "User"
end
