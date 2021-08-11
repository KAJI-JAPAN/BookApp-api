class CreateLogins < ActiveRecord::Migration[6.0]
  def change
    create_table :logins do |t|

      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :activated, null: false, default: false
      t.boolean :admin, null: false, default: false

      t.timestamps
    end
  end
end
