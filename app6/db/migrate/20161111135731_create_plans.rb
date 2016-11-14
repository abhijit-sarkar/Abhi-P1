class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.integer :plan_no
      t.text :plan_name
      t.text :company_name
      t.integer :duration
      t.integer :bonus
      t.integer :roi

      t.timestamps
    end
  end
end
