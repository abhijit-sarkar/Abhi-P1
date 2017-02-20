class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :plan_id , null: false
      t.string :description , null: false
      t.references :customer , foreign_key: true , null: false

      t.timestamps
    end
  end
end
