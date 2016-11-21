class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :cust_name,:null => false
      t.string :email,:null => false
      t.string :contact,:null => false

      t.timestamps
    end
  end
end
