class User < ApplicationRecord
    has_many :events, foreign_key: "creator_id"

    has_many :attendances
    has_many :attended_events, through: :attendances, source: "event"

    has_many :created_invites, class_name: "Invitation", foreign_key: "invitor_id"

    has_many :invitations, foreign_key: "invited_id"
    has_many :invited_events, through: :invitations, source: "event"
    
    validates :name, uniqueness: true

    def upcoming_events
        self.attended_events.upcoming
    end

    def past_events
        self.attended_events.past
    end
end
 