class CreatePolicies < ActiveRecord::Migration[5.0]
  def change
    create_table :policies do |t|
      t.integer :plan_id , null: false
      t.integer :sum_insured , null: false
      t.integer :duration , null: false
      t.integer :premium , null: false
      t.string :nominee , null: false
	  t.string :premium_mode , null: false
      t.integer :maturity_amount, null: false
      t.date :maturity_date , null: false
      t.string :status
      t.references :customer , foreign_key: true

      t.timestamps
    end
  end
end
