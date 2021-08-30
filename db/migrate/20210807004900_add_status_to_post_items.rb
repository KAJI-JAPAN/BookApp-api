class AddStatusToPostItems < ActiveRecord::Migration[6.0]
  def change
    add_column :post_items, :status, :boolean
    add_column :post_items, [:post_id, :created_at], :integer
  end
end
