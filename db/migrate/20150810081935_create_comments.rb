class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content,  null:false, default: ""
      t.references :post, null:false, index: true
      t.references :user, null:false, index: true

      t.timestamps
    end
  end
end
