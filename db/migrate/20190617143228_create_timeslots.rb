class CreateTimeslots < ActiveRecord::Migration[5.2]
  def change
    create_table :timeslots do |t|
      t.string :timeslot

      t.timestamps
    end
  end
end
