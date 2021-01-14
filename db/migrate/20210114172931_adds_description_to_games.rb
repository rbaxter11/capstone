class AddsDescriptionToGames < ActiveRecord::Migration[6.0]
  def change
    add_column :games, :description, :string
  end
end
