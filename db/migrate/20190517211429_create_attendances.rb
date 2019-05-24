class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.references :event, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end

