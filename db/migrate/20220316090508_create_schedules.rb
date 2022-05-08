class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :color
      t.bigint :start
      t.bigint :end
      t.boolean :timed
      t.boolean :long_time
      t.integer :post_id
      t.integer :long_term_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
