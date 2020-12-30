class Api::MeetupInvitationsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @invitations = MeetupInvitation.all
    render "index.json.jb"
  end

  def show
    input = params["id"]
    @invitation = MeetupInvitation.find_by(id: input)
    render "show.json.jb"
  end

  def update
    input = params["id"]
    @invitation = MeetupInvitation.find_by(id: input)
    @invitation.meetup_id = params["meetup_id"] || @invitation.meetup_id
    @invitation.user_id = params["user_id"] || @invitation.user_id
    @invitation.invited_by_id = params["invited_by_id"] || @invitation.invited_by_id
    @invitation.accepted = params["accepted"] || @invitation.accepted
    if @invitation.save
      render "show.json.jb"
    else
      render json: { error: @invitation.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def create
    @invitation = MeetupInvitation.new({
      meetup_id: params["meetup_id"],
      user_id: params["user_id"],
      invited_by_id: current_user.id,
    })
    if @invitation.save
      render "show.json.jb"
    else
      render json: { error: @invitation.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    input = params["id"]
    @invitation = MeetupInvitation.find_by(id: input)
    @invitation.destroy
    render json: { message: "Invitation deleted" }
  end
end
