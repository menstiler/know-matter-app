class CreateHobbies < ActiveRecord::Migration[5.2]
  def change
    create_table :hobbies do |t|
      t.string :category
      t.string :name
      t.string :subclass
      t.string :image_url

      t.timestamps
    end
  end
end
