class EventsController < ApplicationController
  def index
    if params[:search]
      @events= Event.search(params[:search])
    else
      # @events = Event.where('starts_at  >= ?', DateTime.now)
      @events=Event.all
    end
  end

  def new
    @categories=Category.all
    @venues=Venue.all
    @event=Event.new
  end

  def create
    @event=Event.new(event_params)
      if @event.save
        flash[:success] = "Your event was created"
        redirect_to root_path
      else
        flash[:error] = "#{@event.errors.full_messages.to_sentence}"
        render 'new'
      end
    else

  end
  
  def book
  end

  def edit
  end

  def show
    @event = Event.find(params[:id])
  end
end

  def event_params
    params.require(:event).permit(:starts_at, :venue, :ends_at, :name, :creator_id)
  end