class RemovePostsCounterFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :posts_counter, :bigint
  end
end
