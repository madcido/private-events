class AttendancesController < ApplicationController

    def create
        @attendance = Attendance.new(attendance_params)
        if @attendance.save
            flash["success"] = "You are attending this event now"
            redirect_to event_path(@attendance.event_id)
        else
            flash["error"] = "You are already attending to this event"
            redirect_to event_path(@attendance.event_id)
        end
    end

    def destroy
        
    end

    private

    def attendance_params
        params.require(:attendance).permit(:user_id, :event_id)
    end

end
