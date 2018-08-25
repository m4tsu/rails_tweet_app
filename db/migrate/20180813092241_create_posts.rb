class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text :content
      
      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
