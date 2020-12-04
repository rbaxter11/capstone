class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :num_of_players
      t.integer :duration
      t.integer :difficulty
      t.string :boxart

      t.timestamps
    end
  end
end
