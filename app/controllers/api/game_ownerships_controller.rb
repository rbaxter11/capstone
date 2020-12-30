class Api::GameOwnershipsController < ApplicationController
  def index
    @games = GameOwnership.all
    render "index.json.jb"
  end

  def show
    input = params["id"]
    @game = GameOwnership.find_by(id: input)
    render "show.json.jb"
  end

  def update
    input = params["id"]
    @game = GameOwnership.find_by(id: input)
    @game.game_id = params["game_id"] || @game.game_id
    @game.user_id = params["user_id"] || @game.user_id
    if @game.save
      render "show.json.jb"
    else
      render json: { error: @game.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def create
    @game = GameOwnership.new({
      game_id: params["game_id"],
      user_id: params["user_id"],
    })
    if @game.save
      render "show.json.jb"
    else
      render json: { error: @game.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    input = params["id"]
    @game = GameOwnership.find_by(id: input)
    @game.destroy
    render json: { message: "Game removed from your collection" }
  end
end
