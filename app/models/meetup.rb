class Meetup < ApplicationRecord
  belongs_to :host, class_name: "User"
  belongs_to :participant, class_name: "User"
  belongs_to :game

  validates :location_name, presence: true, length: { in: 4..60 }
  validates :start_time, presence: true, length: { in: 4..60 }
  validates :game_id, presence: true, numericality: { only_integer: true }
  validates :host_id, presence: true, numericality: { only_integer: true }
  validates :participant_id, presence: true, numericality: { only_integer: true }
end
