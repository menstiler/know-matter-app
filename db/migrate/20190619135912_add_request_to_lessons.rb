class AddRequestToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :request, :boolean
  end
end
