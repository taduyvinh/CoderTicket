class TicketsController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def booking
    require current_user
  end
end
