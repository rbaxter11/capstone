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

    data["games"].each do |game_data|
      puts game_data["description"].first(20)
      Game.where(name: game_data["name"]).first_or_create.update(
        name: game_data["name"],
        boxart: game_data["image_url"],
        num_of_players: game_data["max_players"],
        duration: game_data["max_playtime"],
        difficulty: game_data["min_age"],
        description: game_data["description"],
      )
    end
  end
end

# data["games"][0]["name"]
# Game.where(name: game["name"]).first_or_create do |game|
# Figure this ^^ out
