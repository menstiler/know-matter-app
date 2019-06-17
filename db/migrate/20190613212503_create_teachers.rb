class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.text :bio
      t.string :profile_image
      t.belongs_to :hobby, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
