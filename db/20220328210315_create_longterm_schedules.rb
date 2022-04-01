class CreateLongtermSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :longterm_schedules do |t|
      t.string :name
      t.string :color
      t.bigint :start
      t.bigint :end
      t.boolean :timed
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
