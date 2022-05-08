class CreatePostItems < ActiveRecord::Migration[6.0]
  def change
    create_table :post_items do |t|
      t.string :content
      t.references :post, foreign_key: true
      t.boolean :status

      t.timestamps
    end
  end
end
