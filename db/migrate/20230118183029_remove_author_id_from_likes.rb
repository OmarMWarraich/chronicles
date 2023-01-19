class RemoveAuthorIdFromLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :author_id, :bigint
  end
end
