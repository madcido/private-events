class EventsController < ApplicationController
  before_action :redirect_logged_out, except: [:index]

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
    @new_event = Event.new()
    @event = Event.find_by(id: params[:id])
    @attendance = Attendance.new()
    @invitation = Invitation.find_by(event_id: @event.id, invited_id: current_user.id)
    @new_invitations = Invitation.new()
    @possible_invites = User.where.not(id: @event.inviteds.ids)
  end

  def index
    @new_event = Event.new()
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  private

  def events_params
    params.require(:event).permit(:name, :description, :date, :private)
  end

  def redirect_logged_out
    redirect_to login_path unless logged_in?
  end
  
end
