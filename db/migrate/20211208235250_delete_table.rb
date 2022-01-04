class DeleteTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :logins
  end
end
