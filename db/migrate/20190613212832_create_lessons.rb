class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :location
      t.string :time
      t.belongs_to :student, foreign_key: true
      t.belongs_to :teacher, foreign_key: true

      t.timestamps
    end
  end
end
