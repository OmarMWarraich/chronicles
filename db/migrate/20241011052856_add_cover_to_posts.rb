class AddCoverToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :cover, :string, default: ''
  end
end
