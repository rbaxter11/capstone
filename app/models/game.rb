class Game < ApplicationRecord
  # belongs_to :user
  has_many :meetups
  has_many :game_ownerships
  has_many :users, through: :game_ownerships

  validates :name, presence: true, length: { in: 4..60 }
  validates :num_of_players, presence: true, numericality: { only_integer: true }
  validates :duration, presence: true, numericality: { only_integer: true }
  validates :difficulty, presence: true, numericality: { only_integer: true }
end
