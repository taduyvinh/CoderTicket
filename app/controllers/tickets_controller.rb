class TicketsController < ApplicationController
  def new
    @event = Event.find params[:event_id]
    @ticket = TicketType.new
  end

  def create
    @event = Event.find params[:event_id]
    @ticket = @event.ticket_type.create
      if @ticket.save
        flash[:success] = "Added ticket type"
        redirect_to event_path
      else
        flash[:error] = "Cant create ticket type"
        render 'new'
      end
  end

  
end
