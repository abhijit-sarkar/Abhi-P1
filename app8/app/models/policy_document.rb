class PolicyDocument < ApplicationRecord
  belongs_to :policy
  has_attached_file :image, styles: { }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
