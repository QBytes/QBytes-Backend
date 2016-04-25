class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.string :description
      t.string :url

      t.timestamps null: false
    end
    add_index :posts, [:title] 
  end
end
