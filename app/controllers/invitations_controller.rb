class InvitationsController < ApplicationController
        
    def create
        @invitation = Invitation.new(invitation_params)
        if @invitation.save
            flash["success"] = "Invitation sent"
            redirect_to event_path(@invitation.event_id) 
        else
            flash["error"] = "Invalid invitation"
            redirect_to event_path(@invitation.event_id) 
        end
    end

    private

    def invitation_params
        params.require(:invitation).permit(:invited_id, :event_id, :invitor_id)
    end
    
end
