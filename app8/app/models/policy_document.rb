class PolicyDocument < ApplicationRecord
  belongs_to :policy
  has_attached_file :image, styles: { }
  validates_attachment_content_type :image,:content_type => ["application/pdf", 'application/msword','application/msppt', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document',"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet","application/vnd.openxmlformats-officedocument.presentationml.presentation","image/jpg", "image/png", "image/jpeg"]
end
