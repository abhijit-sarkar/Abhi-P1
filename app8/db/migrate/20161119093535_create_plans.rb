class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans do |t|
      t.string :plan_name,:null => false
      t.integer :max_tenure,:null => false
      t.integer :roi,:null => false
      t.integer :bonus,:null => false
      t.references :com, index: true, foreign_key: true

      t.timestamps
    end
  end
end
