class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :name
      t.string :color
      t.bigint :start
      t.bigint :end
      t.boolean :timed
      t.boolean :long_time
      t.integer :post_item_id
      t.integer :post_id
      t.integer :long_term_id

      t.timestamps
    end
  end
end
