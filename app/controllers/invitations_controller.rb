class InvitationsController < ApplicationController
        
    def create
        @invitation = current_user.created_invites.build(invitation_params)
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
        params.require(:invitation).permit(:invited_id, :event_id)
    end
    
end
