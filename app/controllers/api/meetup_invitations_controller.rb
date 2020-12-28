class Api::MeetupInvitationsController < ApplicationController
  def create
    @meetup_invitation = MeetupInvitation.new(
      meetup_id: params["meetup_id"],
      invited_by_id: params["invited_by_id"],
    )
  end
end
