class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :plan_name , null: false
      t.integer :max_tenure , null: false
      t.integer :interest , null: false
      t.integer :bonus , null: false
      t.integer :min_amount , null: false
      t.integer :max_amount , null: false
      t.references :company , foreign_key: true , null: false

      t.timestamps
    end
  end
end
