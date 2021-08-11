class AddStatusToPostItems < ActiveRecord::Migration[6.0]
  def change
    add_column :post_items, :status, :boolean
  end
end
