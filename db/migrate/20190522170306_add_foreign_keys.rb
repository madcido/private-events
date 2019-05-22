class AddForeignKeys < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :events, :users, column: :creator_id

    add_foreign_key :attendances, :users, column: :user_id
    add_foreign_key :attendances, :events, column: :event_id

    add_foreign_key :invitations, :users, column: :invitor_id
    add_foreign_key :invitations, :users, column: :invited_id
    add_foreign_key :invitations, :events, column: :event_id
  end
end
