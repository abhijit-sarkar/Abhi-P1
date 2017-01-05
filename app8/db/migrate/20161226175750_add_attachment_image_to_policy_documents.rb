class AddAttachmentImageToPolicyDocuments < ActiveRecord::Migration
  def self.up
    change_table :policy_documents do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :policy_documents, :image
  end
end
