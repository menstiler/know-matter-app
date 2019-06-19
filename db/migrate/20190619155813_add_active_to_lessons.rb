class AddActiveToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :active, :boolean
  end
end
