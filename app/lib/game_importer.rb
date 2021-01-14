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
        description: game["description"],
      )
      new_game.save
    end
    "done"
  end

  def self.update
    response = HTTP.get("https://api.boardgameatlas.com/api/search?client_id=JLBr5npPhV")
    data = response.parse

    data["games"].each do |game|
      current_game = Game.where(name: game["name"]).first_or_create do |info|
        current_game.boxart: info["image_url"],
        current_game.num_of_players: info["max_players"],
        current_game.duration: info["max_playtime"],
        current_game.difficulty: info["min_age"],
        current_game.description: info["description"],
      end
    end
  end
end

# data["games"][0]["name"]
# Game.where(name: game["name"]).first_or_create do |game|
# Figure this ^^ out
