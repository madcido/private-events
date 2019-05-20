class EventsController < ApplicationController

  def create
    @event = current_user.events.build(events_params)
    if @event.save
      flash["success"] = "Event created"
      Attendance.create(user_id: current_user.id, event_id: @event.id)
      Invitation.create(invitor_id: current_user.id, invited_id: current_user.id, event_id: @event.id)
      redirect_to @event
    else
      flash["error"] = "Event not created"
      redirect_to root_path
    end
  end

  def show
    @event = Event.find_by(id: params[:id])
    @attendance = Attendance.new()
    @invitation = Invitation.find_by(event_id: @event.id, invited_id: current_user.id)
    @invitations = Invitation.new()
  end

  def index
    @event = Event.new()
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  private

  def events_params
    params.require(:event).permit(:name, :description, :date, :private)
  end
  
end
