class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :plan_id
      t.references :customer, index: true, foreign_key: true
      t.string :desc

      t.timestamps
    end
  end
end
