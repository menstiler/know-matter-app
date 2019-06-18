class AddDayToTimeslots < ActiveRecord::Migration[5.2]
  def change
    add_column :timeslots, :day, :string
    add_column :timeslots, :time, :string
  end
end
