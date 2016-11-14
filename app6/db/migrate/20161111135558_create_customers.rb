class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.integer :client_id
      t.string :cname
      t.string :contact
      t.string :email

      t.timestamps
    end
  end
end
