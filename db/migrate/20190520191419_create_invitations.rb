class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.boolean    :accepted, default: false
      t.references :event, index: true
      t.references :invited, index: true
      t.references :invitor, index: true

      t.timestamps
    end
  end
end
