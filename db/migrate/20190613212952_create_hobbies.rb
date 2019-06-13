class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.string :name
      t.string :category

      t.timestamps
    end
  end
end
