class Api::MeetupsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @meetups = Meetup.all
    render "index.json.jb"
  end

  def show
    input = params["id"]
    @meetup = Meetup.find_by(id: input)
    render "show.json.jb"
  end

  def create
    @meetup = Meetup.new({
      location_name: params["location_name"],
      datetime: params["datetime"],
      game_id: params["game_id"],
      host_id: params["host_id"],
      participant_id: params["participant_id"],
    })
    if @meetup.save
      render "show.json.jb"
    else
      render json: { error: @meetup.errors.full_messages },
             status: :unprocessable_entity
    end
  end
end
