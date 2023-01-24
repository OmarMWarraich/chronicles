class AddPostsCounterToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_counter, :bigint, default: 0, null: false
  end
end
