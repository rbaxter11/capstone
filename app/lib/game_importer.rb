require "http"

class GameImporter
  def self.import
    response = HTTP.get("https://api.boardgameatlas.com/api/search?client_id=JLBr5npPhV")
    data = response.parse

    data["games"].each do |game|
      # puts "name: #{game["name"]}"
      new_game = Game.new(
        name: game["name"],
        boxart: game["image_url"],
        num_of_players: game["max_players"],
        duration: game["max_playtime"],
        difficulty: game["min_age"],
      )
      new_game.save
    end
    "done"
  end
end

# data["games"][0]["name"]
