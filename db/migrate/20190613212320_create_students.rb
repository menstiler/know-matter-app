class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.string :email
      t.string :profile_image

      t.timestamps
    end
  end
end
