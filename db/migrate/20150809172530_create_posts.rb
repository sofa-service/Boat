class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title,    null: false, default: ""
      t.string :content,  null: false, default: ""
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :posts, :user_id
  end
end
