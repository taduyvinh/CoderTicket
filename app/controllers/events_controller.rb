class EventsController < ApplicationController
  def index
    if params[:search]
      @events= Event.search(params[:search])
    else
      # @events = Event.where('starts_at  >= ?', DateTime.now)
      @events=Event.all
    end
  end

before_action :check_event_changing_permission


  def new
   @venues = Venue.all 
   @categories = Category.all 
   @event=Event.new 
 end

  def create
    if current_user
      @venues = Venue.all
      @categories = Category.all
      @event=Event.new(event_params)
        if @event.save
          flash[:success] = "Your event was created"
          redirect_to root_path
        else
          flash[:error] = "#{@event.errors.full_messages.to_sentence}"
          render 'new'
        end
    else
      flash[:error]="Pleas log in first"
      redirect_to login_path
    end

  end
  
  # def published
  #   @venues = Venue.all
  #   @categories = Category.all
  #   # @event = Event.find params[:id]
  #   # if @event.user_id == current_user.id
      
  #   # else
      
  #   # end

  # end

  def edit
   @venues = Venue.all 
   @categories = Category.all 
   @event=Event.new 
  end

  def update
    @event = Event.find(params[:id])
    if @event.update
      flash[:success] = "Updated Event"
      render 'show'
    else
      flash[:error] = "#{@event.errors.full_messages.to_sentence}"
      render 'edit'
    end
  end

  def check_event_changing_permission
    @event = Event.find(params[:id])
    unless @event.id = current_user.id
      flash[:error] = "You can't edit this event"
      redirect_to root_path
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:starts_at, :venue_id, :category_id, :ends_at, :extended_html_description, :name, :creator_id)
  end
end