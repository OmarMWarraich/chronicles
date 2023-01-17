class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.bigint :author_id
      t.string :title
      t.string :text
      t.bigint :comments_counter
      t.string :likes_counter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :posts, :author_id
  end
end
