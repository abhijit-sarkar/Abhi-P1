class CreatePols < ActiveRecord::Migration[5.0]
  def change
    create_table :pols do |t|
      t.integer :client_id
      t.string :cname
      t.string :nominee
      t.string :sum_insured
      t.string :premium
      t.date :maturity_date
      t.integer :customer_id
      t.integer :plan_no
      t.string :status

      t.timestamps
    end
  end
end
