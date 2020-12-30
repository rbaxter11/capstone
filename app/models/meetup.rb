class Meetup < ApplicationRecord
  belongs_to :host, class_name: "User"
  belongs_to :game
  has_many :meetup_invitations
  has_many :users, through: :meetup_invitations

  validates :location_name, presence: true, length: { in: 4..60 }
  validates :start_time, presence: true, length: { in: 4..60 }
  validates :game_id, presence: true, numericality: { only_integer: true }
  validates :host_id, presence: true, numericality: { only_integer: true }

  def self.player_names
    meetups = Meetup.all
    usernames = meetups.map do |meetup|
      meetup.users.map do |user|
        user.username
      end
    end
  end
end
