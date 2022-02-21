class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :color
      t.string :start
      t.string :end

      t.timestamps
    end
  end
end
