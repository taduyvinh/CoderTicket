class VenuesController < ApplicationController
  def new
    @venues=Venue.new
  end

  def index
    @venues=Venue.all
  end

  def create
    @venue=Venue.new(venue_params)
    if @venue.save
      flash[:success] ="Venue created"
      redirect_to venues_path
    else
      flash[:error]="Cant create venue"
      render 'new'
    end
  end

  def venue_params
    params.require(:venue).permit(:name, :region_id)
  end
end

