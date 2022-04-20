class AddColumnUserReference < ActiveRecord::Migration[6.0]
  def up
    add_column :schedules, :user_id, :integer
  end

  def down
    remove_column :schedules, :user_id, :integer
  end
end
