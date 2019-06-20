class AddMessageToLessons < ActiveRecord::Migration[5.2]
  def change
    add_column :lessons, :message, :string, default: nil
  end
end
