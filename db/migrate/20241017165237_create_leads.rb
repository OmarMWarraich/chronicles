class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email
      t.string :device
      t.string :country

      t.timestamps
    end
  end
end
