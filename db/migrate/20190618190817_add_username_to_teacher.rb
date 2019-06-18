class AddUsernameToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :username, :string
  end
end
