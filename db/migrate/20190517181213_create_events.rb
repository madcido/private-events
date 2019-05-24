class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.date :date
      t.boolean :private
      t.references :creator, index: true

      t.timestamps
    end
  end
end
