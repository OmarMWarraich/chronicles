class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.string :bio
      t.bigint :posts_counter
      t.string :role, default: ''

      t.timestamps
    end
  end
end
