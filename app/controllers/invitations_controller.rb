class InvitationsController < ApplicationController
        
    def create
        @invitations = Invitation.new(invitation_params)
        if @invitations.save
            flash["success"] = "Invitation sent"
            redirect_to event_path(@invitations.event_id) 
        else
            flash["error"] = "You already invited"
            redirect_to event_path(@invitations.event_id) 
        end
    end




    def update


    end




    private

    def invitation_params
        params.require(:invitation).permit(:invited_id, :event_id, :accepted,:invitor_id)
    end
    
end
