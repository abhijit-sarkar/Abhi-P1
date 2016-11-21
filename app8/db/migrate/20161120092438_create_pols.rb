class CreatePols < ActiveRecord::Migration[5.0]
  def change
    create_table :pols do |t|
      t.integer :plan_id
      t.references :customer, index: true, foreign_key: true
      t.integer :sum_insured
      t.integer :duration
      t.integer :premium
      t.string :nominee
      t.integer :maturity_amount
      t.date :maturity_date
	  t.string :status
      t.timestamps
    end
  end
end
