class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.boolean :status
      t.belongs_to :teacher, foreign_key: true
      t.belongs_to :timeslot, foreign_key: true

      t.timestamps
    end
  end
end
