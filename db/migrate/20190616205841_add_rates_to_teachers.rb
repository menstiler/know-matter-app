class AddRatesToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :rates, :integer
  end
end
