class CreatePolicyDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :policy_documents do |t|
      t.string :title
	  t.references :policy, foreign_key: true
      t.timestamps
    end
  end
end
