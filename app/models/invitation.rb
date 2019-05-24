class Invitation < ApplicationRecord
    belongs_to :invited, class_name: "User"
    belongs_to :event
    belongs_to :invitor, class_name: "User"

    validates :invited_id, uniqueness: { scope: :event_id }
end
