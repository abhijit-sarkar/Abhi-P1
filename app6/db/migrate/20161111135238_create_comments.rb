class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :plan_no
      t.integer :client_id
      t.string :desc
      t.integer :customer_id
      t.integer :plan_id

      t.timestamps
    end
  end
end
