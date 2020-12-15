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
      start_time: params["start_time"],
      game_id: params["game_id"],
      host_id: current_user.id,
      participant_id: params["participant_id"],
    })
    if @meetup.save
      render "show.json.jb"
    else
      render json: { error: @meetup.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    if current_user
      input = params["id"]
      @meetup = Meetup.find_by(id: input)
      @meetup.location_name = params["location_name"] || @meetup.location_name
      @meetup.start_time = params["start_time"] || @meetup.start_time
      @meetup.game_id = params["game_id"] || @meetup.game_id
      @meetup.participant_id = params["participant_id"] || @meetup.participant_id
      if @meetup.save
        render "show.json.jb"
      else
        render json: { error: @meetup.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end

  def destroy
    input = params["id"]
    @meetup = Meetup.find_by(id: input)
    @meetup.destroy
    render json: { message: "Meetup removed" }
  end
end
