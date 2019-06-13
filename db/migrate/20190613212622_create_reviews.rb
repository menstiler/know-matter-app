class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating
      t.belongs_to :teacher, foreign_key: true
      t.belongs_to :student, foreign_key: true

      t.timestamps
    end
  end
end
