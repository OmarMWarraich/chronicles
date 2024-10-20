class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :product
      t.integer :amount
      t.string :state, default: "pending"

      t.timestamps
    end
  end
end
