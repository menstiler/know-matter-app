class AddLocationToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :location, :string
  end
end
