class InvitationsController < ApplicationController


    def create
        
    end


    def update


    end


    private


    def invitation_params
        params.require(:invitation).permit(:invited_id,:event_id,:accepted)
    end

end