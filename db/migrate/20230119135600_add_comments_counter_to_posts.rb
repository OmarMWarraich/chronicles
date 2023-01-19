class AddCommentsCounterToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comments_counter, :bigint, default: 0
  end
end
