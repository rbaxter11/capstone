class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 4..15 }

  has_many :game_ownerships
  has_many :games, through: :game_ownerships
  # has_many :participant_meetups, class_name: "Meetup", foreign_key: "participant_id"
  # has_many :participants, through: :participant_meetups, source: :participant

  has_many :meetup_invitations
  has_many :meetups, through: :meetup_invitations

  has_many :host_meetups, class_name: "Meetup", foreign_key: "host_id"
  has_many :hosts, through: :host_meetups, source: :host
end
