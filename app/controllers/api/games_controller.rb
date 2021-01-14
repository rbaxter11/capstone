class Api::GamesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def create
    @game = Game.new({
      name: params["name"],
      num_of_players: params["num_of_players"],
      duration: params["duration"],
      difficulty: params["difficulty"],
      boxart: params["boxart"],
    })
    if @game.save
      render "show.json.jb"
    else
      render json: { error: @game.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def index
    @games = Game.order(:name)
    render "index.json.jb"
  end

  def show
    input = params["id"]
    @game = Game.find_by(id: input)
    render "show.json.jb"
  end

  def update
    input = params["id"]
    @game = Game.find_by(id: input)
    @game.name = params["name"] || @game.name
    @game.num_of_players = params["num_of_players"] || @game.num_of_players
    @game.duration = params["duration"] || @game.duration
    @game.difficulty = params["difficulty"] || @game.difficulty
    @game.boxart = params["boxart"] || @game.boxart

    if @game.save
      render "show.json.jb"
    else
      render json: { error: @game.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    input = params["id"]
    @game = Game.find_by(id: input)
    @game.destroy
    render json: { message: "Game removed" }
  end
end
