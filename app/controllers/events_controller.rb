class EventsController < ApplicationController

  def create
    @user = User.find_by(id: session[:id])
    @event = @user.events.build(events_params)
    if @event.save
      flash["success"] = "Event created"
      redirect_to @event
    else
      flash["error"] = "Event not created"
      render :index
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
  end

  def index
    @event = Event.new()
    @events = Event.all
  end

  private

  def events_params
    params.require(:event).permit(:name, :description, :date)
  end
  
end
