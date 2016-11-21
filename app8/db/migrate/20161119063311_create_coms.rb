class CreateComs < ActiveRecord::Migration[5.0]
  def change
    create_table :coms do |t|
      t.string :com_name,:null => false
      t.string :contact,:null => false
      t.string :address,:null => false

      t.timestamps
    end
  end
end
