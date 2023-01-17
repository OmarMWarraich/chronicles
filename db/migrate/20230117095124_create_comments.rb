class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.bigint :author_id
      t.string :text
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, :author_id
  end
end
